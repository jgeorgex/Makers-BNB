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
    end
  end

  describe '#authenticate' do
    it 'returns a user given a correct email and password if it exists' do
      MbnbUser.create(email: 'test@test.com', username: 'TestUserName',
      firstname: 'John', surname: 'Bloggs', password: 'makers123')

      expect(MbnbUser.authenticate('test@test.com', 'makers123')).to eq true
    end
  end

  describe '#find_by_email' do
    it 'finds the user on the by email database' do

      user = MbnbUser.create(email: 'test@test.com', username: 'TestUserName',
      firstname: 'John', surname: 'Bloggs', password: 'makers123')
      expect(MbnbUser.find_by_email(user.email).username).to eq(user.username)
    end
  end

end
