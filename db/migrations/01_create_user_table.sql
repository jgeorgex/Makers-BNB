CREATE TABLE makersbnb_users (id SERIAL PRIMARY KEY, email VARCHAR(60) UNIQUE, username VARCHAR(60) UNIQUE, firstname VARCHAR(60), surname VARCHAR(60), password VARCHAR(60));
