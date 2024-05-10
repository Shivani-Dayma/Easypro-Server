# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

run Rails.application

Rails.application.load_server

# config/initializers/mime_types.rb

# Register xlsx as a MIME type for responding to xlsx format requests
Mime::Type.register "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", :xlsx


  