require_relative './database_connection.rb'

if ENV['ENVIRONMENT'] == 'test'
  p "connecting to test"
  DatabaseConnection.setup('makers_bnb_test')
else
  p "connecting to main"
  DatabaseConnection.setup('makers_bnb')
end
