def sign_up
  visit('/')
  fill_in 'email', with: 'abc@gmail.com'
  fill_in 'username', with: 'abc'
  fill_in 'firstname', with: 'abc'
  fill_in 'lastname', with: 'xyz'
  fill_in 'password', with: 'qwerty'
  click_button 'submit'
end

def populate_property_database
  user1 = MbnbUser.create(email: '123@gmail.com', username: 'Test1', firstname: 'Bob', surname: 'Ross', password: '12345')
  property1 = Property.create(user_id: user1.id, name: 'My House', address: '123 Test Road', description: 'House', capacity: '2', pricepn: '5')

  user2 = MbnbUser.create(email: '234@yahoo.com', username: 'Test2', firstname: 'Bob', surname: 'Smith', password: '56789')
  property2 = Property.create(user_id: user2.id, name: 'Second House', address: '1 Commercial St', description: 'Flat', capacity: '3', pricepn: '6')

  property3 = Property.create(user_id: user1.id, name: 'Third House', address: '7 Test Street', description: 'Bungalow', capacity: '4', pricepn: '8')
end
