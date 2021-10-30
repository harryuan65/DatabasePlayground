require 'pry'
require 'faker'
require 'benchmark'
require_relative('./utils/con.rb')
require_relative('./utils/show_columns.rb')

Dir['./models/*.rb'].each do |f|
  require_relative f
end

# puts ActiveRecord::Base.descendants
# puts ActiveRecord::Base.connection.tables
binding.pry
