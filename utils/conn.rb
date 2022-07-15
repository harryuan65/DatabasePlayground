require "psych"

playground_db_config = Psych.safe_load(File.read("config/database.yml"))
ActiveRecord::Base.establish_connection(playground_db_config)
