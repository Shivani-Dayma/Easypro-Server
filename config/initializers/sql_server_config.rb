require 'tiny_tds'

# Define your connection options
connection_options = {
  username: 'sa',
  password: 'Admin@123',
  # host: '192.168.0.51',
  # port: 1433,
  host: '125.99.200.202',
  port: '1450',
  database: 'ETP'
}

# Create a TinyTDS client
client = TinyTds::Client.new(connection_options)


# Execute SQL commands to set options
client.execute("SET ANSI_DEFAULTS ON")
client.execute("SET QUOTED_IDENTIFIER ON")
client.execute("SET CURSOR_CLOSE_ON_COMMIT OFF")
client.execute("SET IMPLICIT_TRANSACTIONS OFF")
client.execute("SET TEXTSIZE 2147483647")
client.execute("SET CONCAT_NULL_YIELDS_NULL ON")

# Close the client connection
client.close
