# app/services/attendance_service.rb
class AttendanceService
    require 'axlsx'
    require 'rest-client'
    require 'json'
    require 'net/http'
    require 'set'
  
    def initialize; end
  
    def employee_excel(team_leads_and_employees, time_range)
        start_date = time_range[:start_date]
      end_date = time_range[:end_date]
      ist_time_zone = 'Asia/Kolkata'
      usa_time_zone = 'Eastern Time (US & Canada)'
      generated_files = {}
      sent_emails = Set.new # Track sent emails to prevent duplicates
  
      team_leads_and_employees.each do |team_lead_email, emp_ids|
        emp_ids.each do |emp_id|
          # Check if email for this date range has already been sent
          next if sent_emails.include?("#{team_lead_email}_#{emp_id}_#{start_date}_#{end_date}")

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

          # Add sent email to the set
          sent_emails.add("#{team_lead_email}_#{emp_id}_#{start_date}_#{end_date}")
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
  