require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('natter_test')
else
  DatabaseConnection.setup('natter')
end