# app/services/attendance_service.rb
class AttendanceService
    require 'axlsx'
    require 'rest-client'
    require 'json'
    require 'net/http'
  
    def initialize; end
  
    def flow
      # This method will fetch flows and nodes from EasyPro workflow
      username = 'Webkorps'
      password = 'Webkorps@9806'
      url = URI.parse('http://125.99.200.202:8081/workflow/workflowengine/table/?page=1&limit=500')
      http = Net::HTTP.new(url.host, url.port)
      request = Net::HTTP::Get.new(url.request_uri)
      request.basic_auth(username, password)
      response = http.request(request)
  
      if response.code == '200'
        data = JSON.parse(response.body)
        @workflow_data = {}
  
        data['data'].each do |workflow|
          # Extract specific data from the JSON response and store it in @workflow_data hash
          workflow_code = workflow['workflow_code']
          employee_data = fetch_employee_data(workflow['get_employee'], workflow_code)
          # Add extracted data to @workflow_data hash
          @workflow_data[workflow_code] = {
            emails: employee_data[:emails],
            ids: employee_data[:ids]
          }
        end
        # Print the @workflow_data hash
        formatted_output = format_workflow_data
        formatted_output # Return the formatted output
      else
        @error_message = "Error: #{response.code} - #{response.message}"
        @error_message # Return the error message
      end
    end
  
    def employee_excel(team_leads_and_employees, time_range)
        start_date = time_range[:start_date]
      end_date = time_range[:end_date]
      ist_time_zone = 'Asia/Kolkata'
      usa_time_zone = 'Eastern Time (US & Canada)'
      generated_files = {}
  
      team_leads_and_employees.each do |team_lead_email, emp_ids|
        emp_ids.each do |emp_id|
          employee = PersonnelEmployee.find_by(emp_code: emp_id)
          next unless employee.present?
  
          time_zone = employee.nickname == 'Night' ? usa_time_zone : ist_time_zone
  
          package = Axlsx::Package.new
          employee_transactions = IclockTransaction.includes(:personnel_employee)
                                                    .where(punch_time: start_date.beginning_of_day..end_date.end_of_day, emp_code: emp_id)
          workbook = package.workbook
          sheet_name = "Attendance Records - #{emp_id}"
          workbook.add_worksheet(name: sheet_name) do |sheet|
            header_style = workbook.styles.add_style(header_style_options)
            data_style = workbook.styles.add_style(data_style_options)
            sheet.add_row [
              'Employee Id', 'First Name', 'Department Name', 'Date', 'Weekday',
              'First Check-in Time', 'Last Check-out Time', 'Break Time', 'Total Time'
            ], style: header_style
            department_names = PersonnelDepartment.pluck(:id, :dept_name).to_h
            (start_date..end_date).each do |date|
              transactions_for_date = employee_transactions.select { |t| t.punch_time.to_date == date }
              if transactions_for_date.empty?
                sheet.add_row [
                  emp_id,
                  employee&.first_name || '',
                  PersonnelDepartment.find_by(id: employee&.department_id)&.dept_name || ' ',
                  date.strftime('%d/%m/%Y'),
                  date.strftime('%A'),
                  'Weekend/WFH/OnLeave', 'Weekend/WFH/OnLeave', 'Weekend/WFH/OnLeave', 'Weekend/WFH/OnLeave'
                ], style: data_style
              else
                transactions_for_date.group_by { |t| t.personnel_employee&.first_name }.each do |employee_name, transactions|
                  transactions.group_by { |t| t.punch_time.to_date }.each do |date, date_transactions|
                    check_in_times = date_transactions.select { |t| t.punch_state == '0' }.map(&:punch_time)
                    check_out_times = date_transactions.select { |t| t.punch_state == '1' }.map(&:punch_time)
                    next if check_in_times.empty? || check_out_times.empty?
                    check_in_times.sort!
                    check_out_times.sort!
                    first_check_in_time = check_in_times.min
                    first_check_in_time = first_check_in_time.in_time_zone('UTC').strftime('%H:%M:%S')
                    last_check_out_time = check_out_times.max
                    last_check_out_time = last_check_out_time.in_time_zone('UTC').strftime('%H:%M:%S')
                    total_office_seconds = check_out_times.max - check_in_times.min
                    total_break_seconds = 0
                    (0..(check_in_times.length - 2)).each do |index|
                      total_break_seconds += (check_in_times[index + 1] - check_out_times[index]) if check_out_times[index]
                    end
                    total_office_seconds -= total_break_seconds
                    if total_office_seconds < 0 || total_break_seconds < 0
                      total_time = 'Miss Punch'
                      break_time = 'Miss Punch'
                    else
                      total_office_hours = (total_office_seconds / 3600).to_i
                      total_office_minutes = ((total_office_seconds % 3600) / 60).to_i
                      total_office_seconds = (total_office_seconds % 60).to_i
                      total_time = format('%02d:%02d:%02d', total_office_hours, total_office_minutes, total_office_seconds)
                    end
                    break_time_seconds = total_break_seconds
                    if break_time_seconds < 0
                      break_time = 'Punch Missing'
                    else
                      break_hours = (break_time_seconds / 3600).to_i
                      break_minutes = ((break_time_seconds % 3600) / 60).to_i
                      break_seconds = (break_time_seconds % 60).to_i
                      break_time = format('%02d:%02d:%02d', break_hours, break_minutes, break_minutes)
                    end
                    sheet.add_row [
                      transactions.first.personnel_employee.emp_code,
                      employee_name,
                      department_names[transactions.first.personnel_employee.department_id],
                      date.strftime('%d/%m/%Y'),
                      date.strftime('%A'),
                      (first_check_in_time || '').prepend('  ').concat('   '),
                      (last_check_out_time || '').prepend('  ').concat('   '),
                      (break_time || '').prepend('   ').concat('   '),
                      (total_time || '').prepend('   ').concat('   ')
                    ], style: data_style
                  end
                end
              end
            end
          end
  
          if employee_transactions.first&.personnel_employee
            employee_first_name = employee_transactions.first.personnel_employee.first_name || 'report'
          else
            employee_first_name =  PersonnelEmployee.find_by(emp_code: emp_id)&.first_name || 'report'
          end
  
          filename = "#{employee_first_name}-#{start_date.strftime('%d-%b')}-to-#{end_date.strftime('%d-%b')}"
          file_path = Rails.root.join('tmp', filename)
  
          File.open(file_path, 'wb') do |file|
            file.write(package.to_stream.read)
          end
  
          generated_files[team_lead_email] ||= []
          generated_files[team_lead_email] << file_path
        end
      end
  
      generated_files.each do |team_lead_email, files|
        begin
          # Assuming UserMailer is defined elsewhere
          UserMailer.send_excel_with_attachments(email: team_lead_email, file_paths: files).deliver_now
        rescue StandardError => e
          # Handle error
        end
      end
    end
  
    private
  
    def fetch_employee_data(employee_names, role_code)
      role_name = WorkFlowWorkflowrole.find_by(role_code: role_code)&.role_name
      return unless role_name
  
      role_name_emails = []
      employee_ids = []
      role_name.split(',').map(&:strip).each do |name|
        employee = PersonnelEmployee.find_by("LOWER(first_name) = ?", name.downcase)
        role_name_emails << employee.email if employee
      end
      employee_names.split(',').map(&:strip).each do |employee_name|
        employee = PersonnelEmployee.find_by("LOWER(first_name) = ?", employee_name.downcase)
        employee_ids << employee.emp_code if employee
      end
      { emails: role_name_emails, ids: employee_ids }
    end
  
    def format_workflow_data
      formatted_data = @workflow_data.map do |workflow_code, data|
        emails = data[:emails].map { |email| email.gsub('"', '') }
        emails_with_quotes = emails.map { |email| "\"#{email}\"" }.join(', ')
        ids = data[:ids].map { |id| "\"#{id}\"" }.join(', ')
        "#{emails_with_quotes} => [#{ids}]"
      end
      "{#{formatted_data.join(', ')}}"
    end
  
    def header_style_options
      {
        b: true, # bold text
        bg_color: 'FFFF00', # yellow background color
        alignment: { horizontal: :center } # center alignment
      }
    end
  
    def data_style_options
      {
        alignment: { horizontal: :center } # center alignment
      }
    end
  end
  