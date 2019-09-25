CREATE TABLE makersbnb_reservations (id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES makersbnb_users (id), property_id INTEGER REFERENCES makersbnb_properties (id), res_date DATE));
