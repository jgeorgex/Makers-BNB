require './lib/mbnb_user.rb'
require './lib/property.rb'

describe Property do
  describe '#create' do
    it 'inserts a property listing into the database' do
      user = MbnbUser.create(email: 'test@test.com', username: 'TestUserName',
      firstname: 'John', surname: 'Bloggs', password: 'makers123')

      listing = Property.create(user_id: user.id, name: 'My house', address: '123 Mullholland Drive', description: 'Awesome shared bed',
      capacity: 4, pricepn: 100)
      expect(listing.capacity).to eq(4)
    end
  end

  describe '#find' do
    it 'finds the property on the database' do

      user = MbnbUser.create(email: 'test@test.com', username: 'TestUserName',
      firstname: 'John', surname: 'Bloggs', password: 'makers123')

      listing = Property.create(user_id: user.id, name: 'My house', address: '123 Mullholland Drive', description: 'Awesome shared bed',
      capacity: 4, pricepn: 100)

      expect(Property.find(listing.id).pricepn).to eq(listing.pricepn)
      expect(Property.find(listing.id).capacity).to eq(listing.capacity)
      # expect(Property.find(listing.id)).to eq(listing)
    end

describe '#user_all' do
  it 'returns all properties listed by a user' do

    user = MbnbUser.create(email: 'test@test.com', username: 'TestUserName',
    firstname: 'John', surname: 'Bloggs', password: 'makers123')

    listing = Property.create(user_id: user.id, name: 'My house', address: '123 Mullholland Drive', description: 'Awesome shared bed',
    capacity: 4, pricepn: 100)
    properties = Property.user_all(user.id)
    expect(properties.first.capacity).to eq(4)

  end
end

describe '#all' do
  it 'returns all properties listed' do
    user = MbnbUser.create(email: 'test@test.com', username: 'TestUserName',
    firstname: 'John', surname: 'Bloggs', password: 'makers123')

    listing = Property.create(user_id: user.id, name: 'My house', address: '123 Mullholland Drive', description: 'Awesome shared bed',
    capacity: 4, pricepn: 100)

    user2 = MbnbUser.create(email: '123@test.com', username: '123UserName',
    firstname: 'Bill', surname: 'Cloggs', password: 'makers123')

    listing2 = Property.create(user_id: user2.id, name: 'My house', address: '100 Mullholland Drive', description: 'Awesome shared bed',
    capacity: 6, pricepn: 150)
    properties = Property.all
    expect(properties.first.capacity).to eq(4)
    expect(properties.last.capacity).to eq(6)
  end
end

  end

end
