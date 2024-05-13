class AttendanceController < ApplicationController
  require 'attendance_service'

  def index
    # Fetching the iclock transactions for the last 7 days with associated personnel employees
    start_date = time_range[:start_date]
    end_date = time_range[:end_date]
    @iclock_transactions = IclockTransaction.includes(:personnel_employee)
                                            .where(punch_time: start_date.beginning_of_day..end_date.end_of_day)
                                            .order(punch_time: :desc)
  end

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
  
  def employee_excel
    service = AttendanceService.new
    flow
    team_leads_and_employees = format_workflow_data
    team_leads_and_employees = eval(format_workflow_data)
    service.employee_excel(team_leads_and_employees,time_range)
    redirect_to root_path
  end

  private

  def time_range
    start_date = (Date.today - 7)
    end_date = Date.today - 1
    { start_date: start_date, end_date: end_date }
  end 

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
end





