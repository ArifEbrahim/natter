require './lib/database_connection.rb'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('natter_test')
else
  DatabaseConnection.setup('natter')
end