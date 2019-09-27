require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'makers_bnb_test')
  connection.exec 'DROP TABLE makersbnb_users, makersbnb_properties, makersbnb_reservations CASCADE'
  connection.exec "CREATE TABLE makersbnb_users (id SERIAL PRIMARY KEY, email VARCHAR(60) UNIQUE, username VARCHAR(60) UNIQUE, firstname VARCHAR(60), surname VARCHAR(60), password VARCHAR(60))"
  connection.exec "CREATE TABLE makersbnb_properties (id SERIAL PRIMARY KEY, name VARCHAR(80), address VARCHAR(280), description VARCHAR(500), capacity INTEGER, pricepn INTEGER, user_id INTEGER REFERENCES makersbnb_users (id))"
  connection.exec "CREATE TABLE makersbnb_reservations (id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES makersbnb_users (id), property_id INTEGER REFERENCES makersbnb_properties (id), res_date DATE, confirmed BOOLEAN DEFAULT FALSE);"
end
