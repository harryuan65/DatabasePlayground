require "pry"
require "faker"
require "benchmark"
require "active_record"
require_relative "./utils/conn"
require_relative "./utils/show_columns"
require_relative "utils/logger"

include Logging

begin
  Dir["./models/*.rb"].each do |f|
    require_relative f
  end
rescue ActiveRecord::NoDatabaseError
  config = ActiveRecord::Base.connection_db_config.configuration_hash
  playground_db_name = config[:database]
  logger.warn("Database #{playground_db_name} does not exist. creating #{playground_db_name}...")

  # Switch to admin
  db_admin_config = config.dup
  db_admin_config[:database] = "postgres"
  ActiveRecord::Base.establish_connection(db_admin_config)

  # Create playground db as admin
  ActiveRecord::Base.connection.create_database(playground_db_name, encoding: "unicode")
  logger.info("Database #{playground_db_name} created")

  # Reconnect to database
  logger.info("Connecting to #{playground_db_name}...")
  ActiveRecord::Base.establish_connection(config)

  retry
end

# puts ActiveRecord::Base.descendants
# puts ActiveRecord::Base.connection.tables
binding.pry
