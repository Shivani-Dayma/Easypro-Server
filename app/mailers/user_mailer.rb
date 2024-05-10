class UserMailer < ApplicationMailer
    def send_excel_with_attachments(email:, file_paths:)
      file_paths.each_with_index do |file_path, index|
        file_name = File.basename(file_path)
        attachments["#{file_name}.xlsx"] = File.read(file_path)
      end
  
      mail(to: email, subject: 'Attendance Records')
    end
  end
  