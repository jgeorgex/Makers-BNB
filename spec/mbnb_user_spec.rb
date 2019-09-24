require './lib/mbnb_user.rb'

describe MbnbUser do

  describe '#create' do
    it 'Adds a user to the database' do
      user = MbnbUser.create(email: 'test@test.com', username: 'TestUserName',
      firstname: 'John', surname: 'Bloggs', password: 'makers123')
      expect(user.surname).to eq ('Bloggs')
    end
  end

  describe '#find' do
    it 'finds the user on the database' do

      user = MbnbUser.create(email: 'test@test.com', username: 'TestUserName',
      firstname: 'John', surname: 'Bloggs', password: 'makers123')

      expect(MbnbUser.find(user.id).username).to eq(user.username)
      expect(MbnbUser.find(user.id).email).to eq(user.email)
      # expect(Property.find(listing.id)).to eq(listing)
    end
  end
end
