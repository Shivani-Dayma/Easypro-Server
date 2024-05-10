class IclockTransaction < ApplicationRecord
  self.table_name = 'iclock_transaction'
  belongs_to :personnel_employee, foreign_key: 'emp_id', primary_key: 'id'
  
  # def self.total_office_hours(employee_id, date)
  #   transactions = where(emp_id: employee_id, punch_time: date.beginning_of_day..date.end_of_day)
  #                  .order(punch_time: :asc)

  #   # Initialize variables
  #   total_office_time = 0
  #   last_checkout = nil

  #   transactions.each do |transaction|
  #     if transaction.punch_state == '1' # Check-in
  #       last_checkout = nil # Reset last_checkout if employee checked in
  #     elsif transaction.punch_state == '0' && last_checkout.nil? # Check-out and no previous check-out
  #       last_checkout = transaction.punch_time
  #     elsif transaction.punch_state == '0' && !last_checkout.nil? # Check-out and there was a previous check-out
  #       total_office_time += (transaction.punch_time - last_checkout)
  #       last_checkout = nil
  #     end
  #   end

  #   total_office_time
  # end
end
