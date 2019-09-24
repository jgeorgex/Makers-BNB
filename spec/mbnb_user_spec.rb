require './lib/mbnb_user.rb'

describe MbnbUser do

  describe '#create' do
    it 'Adds a user to the database' do
      user = MbnbUser.create(email: 'test@test.com', username: 'TestUserName',
      firstname: 'John', surname: 'Bloggs', password: 'makers123')
      expect(user.surname).to eq ('Bloggs')
    end
  end
end
