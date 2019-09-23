require './lib/mbnb_user.rb'
require './lib/property.rb'

describe Property do
  describe '#create' do
    it 'inserts a property listing into the database' do
      user = MbnbUser.create(email: 'test@test.com', username: 'TestUserName',
      firstname: 'John', surname: 'Bloggs', password: 'makers123')

      listing = Property.create(user_id: user.id, address: '123 Mullholland Drive', description: 'Awesome shared bed',
      capacity: 4, pricepn: 100)
      expect(listing.capacity).to eq(4)
    end
  end

  describe '#find' do
    it 'finds the property on the database' do

      user = MbnbUser.create(email: 'test@test.com', username: 'TestUserName',
      firstname: 'John', surname: 'Bloggs', password: 'makers123')

      listing = Property.create(user_id: user.id, address: '123 Mullholland Drive', description: 'Awesome shared bed',
      capacity: 4, pricepn: 100)

      expect(Property.find(listing.id)).to eq(listing)
  
    end
  end

end
