# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever



set :environment, 'development'

# every '*/2 * * * *' do
#   rake 'attendance:send_employee_excel_report'
# end

# every :day, at: '5:00' do
#   rake 'attendance:send_employee_excel_report'
# end

# config/schedule.rb

# Schedule the task to run every Monday at 5:00 AM
every :monday, at: '5:00am' do
  rake 'attendance:send_employee_excel_report'
end
