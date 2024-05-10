# require 'active_support/time'

# # Convert sign-in time from USA time zone to Indian time zone (IST)
# def convert_to_ist(sign_in_time)
#   # Parse the sign-in time in USA time zone (Eastern Time)
#   time_in_usa = Time.strptime(sign_in_time, '%Y-%m-%d %A %H:%M:%S').in_time_zone('Eastern Time (US & Canada)')
  
#   # Convert to Indian Standard Time (IST)
#   time_in_ist = time_in_usa.in_time_zone('Indian Time')

#   # Format the time as HH:MM:SS
#   time_in_ist.strftime('%H:%M:%S')
# end

# # Example usage:
# sign_in_time_usa = '2024-04-22 Monday 06:27:35'
# converted_sign_in_time_ist = convert_to_ist(sign_in_time_usa)
# puts converted_sign_in_time_ist  # Output: 10:57:35
