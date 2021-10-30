require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: :postgresql,
  host: 'localhost',
  port: 5432,
  username: 'postgres',
  database: 'pg101'
)