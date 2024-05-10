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
  
  def employee_excel
    service = AttendanceService.new
     #  flow
    #  team_leads_and_employees = format_workflow_data
    #  team_leads_and_employees = eval(format_workflow_data)
    team_leads_and_employees = {"priyanka.shukla@webkorps.com" => ["E285","E278","E341"]}
    service.employee_excel(team_leads_and_employees,time_range)
    redirect_to root_path

  end

  private

  def time_range
    start_date = (Date.today - 7)
    end_date = Date.today - 1
    { start_date: start_date, end_date: end_date }
  end 

  def fetch_iclock_transactions(start_date, end_date)
    IclockTransaction.includes(:personnel_employee)
                     .where(punch_time: start_date.beginning_of_day..end_date.end_of_day)
                     .order(punch_time: :desc)
  end
end





