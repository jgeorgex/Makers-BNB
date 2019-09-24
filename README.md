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
I want to be able to see my listing.
```

## DATABASE SETUP INSTRUCTIONS:
Production database

 1  Connect to psql
 2  Create the database using the psql command CREATE DATABASE makers_bnb;
 3  Connect to the database using the pqsl command \c makers_bnb;
 4  Run the query we have saved in the file db/migrations/01_create_user_table.sql
 in order to set up the Makers BNB user table.
 5  Run the query we have saved in the file db/migrations/  02_create_properties_table.sql in order to set up the Makers BNB properties table.

Test database

 1  Connect to psql
 2  Create the database using the psql command CREATE DATABASE makers_bnb_test;
 3  Connect to the database using the pqsl command \c makers_bnb_test;
 4  Run the query we have saved in the file db/migrations/01_create_user_table.sql
 5  Run the query we have saved in the file db/migrations/  02_create_properties_table.sql in order to set up the Makers BNB properties table.

 ## RUNNING THE PROGRAM:

 1. Clone this repository.
 ``` $ git clone git@github.com:jgeorgex/Makers-BNB.git ```
 2. run ``` $ bundle install ```
 3. run rack to astart the server using the command
 ``` $ rackup ```
 4. Open the Makers BnB hompage by navigating to the following page in your browser:
 https://localhost:9292/
