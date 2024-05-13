namespace :attendance do
  desc 'Send employee excel report'
  task send_employee_excel_report: :environment do
    require 'net/http'
    require 'uri'

    # Define the URL of the route that triggers the action
    url = URI.parse('http://192.168.10.10:9001/attendance/employee_excel')

    # Make an HTTP GET request to the URL
    response = Net::HTTP.get_response(url)

    # Check the response status
    if response.is_a?(Net::HTTPSuccess)
      puts 'Employee Excel report sent successfully!'
    else
      puts "Failed to send Employee Excel report. HTTP status code: #{response.code}"
    end
  end
end
