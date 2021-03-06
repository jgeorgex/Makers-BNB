```
 /$$      /$$  /$$$$$$  /$$   /$$ /$$$$$$$$ /$$$$$$$   /$$$$$$
| $$$    /$$$ /$$__  $$| $$  /$$/| $$_____/| $$__  $$ /$$__  $$
| $$$$  /$$$$| $$  \ $$| $$ /$$/ | $$      | $$  \ $$| $$  \__/
| $$ $$/$$ $$| $$$$$$$$| $$$$$/  | $$$$$   | $$$$$$$/|  $$$$$$
| $$  $$$| $$| $$__  $$| $$  $$  | $$__/   | $$__  $$ \____  $$
| $$\  $ | $$| $$  | $$| $$\  $$ | $$      | $$  \ $$ /$$  \ $$
| $$ \/  | $$| $$  | $$| $$ \  $$| $$$$$$$$| $$  | $$|  $$$$$$/
|__/     |__/|__/  |__/|__/  \__/|________/|__/  |__/ \______/



             /$$$$$$$  /$$   /$$ /$$$$$$$                      
            | $$__  $$| $$$ | $$| $$__  $$                     
            | $$  \ $$| $$$$| $$| $$  \ $$                     
            | $$$$$$$ | $$ $$ $$| $$$$$$$                      
            | $$__  $$| $$  $$$$| $$__  $$                     
            | $$  \ $$| $$\  $$$| $$  \ $$                     
            | $$$$$$$/| $$ \  $$| $$$$$$$/                     
            |_______/ |__/  \__/|_______/            
```
### Headline specifications

- Any signed-up user can list a new space.
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night.
- Users should be able to offer a range of dates where their space is available.
- Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
- Nights for which a space has already been booked should not be available for users to book that space.
- Until a user has confirmed a booking request, that space can still be booked for that night.

### Nice-to-haves

- Users should receive an email whenever one of the following happens:
 - They sign up
 - They create a space
 - They update a space
 - A user requests to book their space
 - They confirm a request
 - They request to book a space
 - Their request to book a space is confirmed
 - Their request to book a space is denied
- Users should receive a text message to a provided number whenever one of the following happens:
 - A user requests to book their space
 - Their request to book a space is confirmed
 - Their request to book a space is denied
- A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space
- Basic payment implementation though Stripe.

### Mockups

Mockups for MakersBnB are available [here](https://github.com/makersacademy/course/blob/master/makersbnb/makers_bnb_images/MakersBnB_mockups.pdf).


## User Stories

```
As a user
I want to be able to sign up to MakersBnB.

As a user
So that I can let my property I want to add my property to MakersBnB.

As a user
So that i can manage my own listings
I want to be able to see my listings.

As a user
so that I can browse potential properties
I want to be able to see all listings.

As a user
so that I can book a holiday
I want to see the owner's details of a location.

```
## RUNNING THE PROGRAM:

1. Clone this repository.
``` $ git clone git@github.com:jgeorgex/Makers-BNB.git ```
2. run ``` $ bundle install ```
3. Set up your databases as per DATABASE SETUP INSTRUCTIONS below
3. run rack to start the server using the command
``` $ rackup ```
4. Open the Makers BnB homepage by navigating to the following page in your browser:
https://localhost:9292/

## DATABASE SETUP INSTRUCTIONS:
In order to run the Makers BnB App it is necessary to create a database on your local machine prior to launching.  This allows Makers BnB users and properties to be saved between sessions.  

A second 'test' database is required in order to effectively run the RSPEC tests.

Instructions to set up both the 'main' and 'test' databases using PSQL are below:

Setup the main database

 1.  Connect to psql ``` $ psql```
 2.  Create the database using the sql command ``` =# CREATE DATABASE makers_bnb;```
 3.  Connect to the database ``` =# \c makers_bnb```
 4.  Run the query saved in the file db/migrations/01_create_user_table.sql
 in order to set up the Makers BNB user table.
 5.  Run the query saved in the file db/migrations/  02_create_properties_table.sql in order to set up the Makers BNB properties table.
 6. Run the query saved in the file db/migrations/  03_create_date_table.sql in order to set up the Makers BNB dates table.
 7. Run the query saved in the file db/migrations/  04_create_reservations_table.sql in order to set up the Makers BNB reservations table.

Setup the test database:

 1.  Connect to psql ``` $ psql```
 2.  Create the database using the sql command ``` =# CREATE DATABASE makers_bnb_test;```
 3.  Connect to the database using the pqsl command ```\c makers_bnb_test```
 4.  Run the query saved in the file db/migrations/01_create_user_table.sql
 5.  Run the query saved in the file db/migrations/  02_create_properties_table.sql in order to set up the Makers BNB properties table.
