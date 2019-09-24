require_relative './database_connection.rb'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('makers_bnb_test')
else
  DatabaseConnection.setup('makers_bnb')
end
