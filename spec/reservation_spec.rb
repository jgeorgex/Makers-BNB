require 'reservation'
# require 'property'
# require 'mbnb_users'

describe Reservation do
  describe '.create' do
    it "creates a new reservation" do
      user = MbnbUser.create(email: 'test@test.com', username: 'TestUserName',
      firstname: 'John', surname: 'Bloggs', password: 'makers123')
      Property.create(user_id: user.id, name: 'My house', address: '123 Mullholland Drive', description: 'Awesome shared bed', capacity: 4, pricepn: 100)

      result = Reservation.create(property_id: 1, user_id: 1, res_date: "#{Date.parse('25th Sep 2019')}")
      expect(result.guest.id).to eq('1')
      expect(result).to be_a(Reservation)
    end
  end

  describe ".find" do
    it "returns reservation from db and wraps it in a reservation object" do
      user = MbnbUser.create(email: 'test@test.com', username: 'TestUserName',
      firstname: 'John', surname: 'Bloggs', password: 'makers123')
      Property.create(user_id: user.id, name: 'My house', address: '123 Mullholland Drive', description: 'Awesome shared bed', capacity: 4, pricepn: 100)

      Reservation.create(property_id: 1, user_id: 1, res_date: "#{Date.parse('25th Sep 2019')}")
      res = Reservation.find(property_id: 1, res_date: "#{Date.parse('25th Sep 2019')}")
      expect(res.property.id).to eq('1')
      expect(res).to be_a(Reservation)
    end
  end

  describe ".all" do
    it "returns all reservations for a given property" do
      user = MbnbUser.create(email: 'test@test.com', username: 'TestUserName',
      firstname: 'John', surname: 'Bloggs', password: 'makers123')
      Property.create(user_id: user.id, name: 'My house', address: '123 Mullholland Drive', description: 'Awesome shared bed', capacity: 4, pricepn: 100)

      Reservation.create(property_id: 1, user_id: 1, res_date: "#{Date.parse('25th Sep 2019')}")
      Reservation.create(property_id: 1, user_id: 1, res_date: "#{Date.parse('20th Sep 2019')}")
      Reservation.create(property_id: 1, user_id: 1, res_date: "#{Date.parse('22nd Sep 2019')}")

      res = Reservation.all(property_id: 1)
      expect(res.length).to eq(0)
    end
  end

  describe ".requests" do
    it "returns all reservations for a given property" do
      user = MbnbUser.create(email: 'test@test.com', username: 'TestUserName',
      firstname: 'John', surname: 'Bloggs', password: 'makers123')
      Property.create(user_id: user.id, name: 'My house', address: '123 Mullholland Drive', description: 'Awesome shared bed', capacity: 4, pricepn: 100)

      Reservation.create(property_id: 1, user_id: 1, res_date: "#{Date.parse('25th Sep 2019')}")
      Reservation.create(property_id: 1, user_id: 1, res_date: "#{Date.parse('20th Sep 2019')}")
      Reservation.create(property_id: 1, user_id: 1, res_date: "#{Date.parse('22nd Sep 2019')}")

      res = Reservation.requests(property_id: 1)
      expect(res.length).to eq(3)
    end
  end

  describe ".confirm" do
    it "sets the confrimed status of a request to true" do
      user = MbnbUser.create(email: 'test@test.com', username: 'TestUserName',
      firstname: 'John', surname: 'Bloggs', password: 'makers123')
      Property.create(user_id: user.id, name: 'My house', address: '123 Mullholland Drive', description: 'Awesome shared bed', capacity: 4, pricepn: 100)

      request = Reservation.create(property_id: 1, user_id: 1, res_date: "#{Date.parse('25th Sep 2019')}")

      Reservation.confirm(request.id)
      res = DatabaseConnection.query("SELECT confirmed FROM makersbnb_reservations WHERE id=#{request.id};").first
      expect(res['confirmed']).to eq("t")
    end
  end

  describe ".deny" do
    it "deletes the requested reservation" do
      user = MbnbUser.create(email: 'test@test.com', username: 'TestUserName',
      firstname: 'John', surname: 'Bloggs', password: 'makers123')
      Property.create(user_id: user.id, name: 'My house', address: '123 Mullholland Drive', description: 'Awesome shared bed', capacity: 4, pricepn: 100)

      request = Reservation.create(property_id: 1, user_id: 1, res_date: "#{Date.parse('25th Sep 2019')}")

      Reservation.deny(request.id)
      res = DatabaseConnection.query("SELECT confirmed FROM makersbnb_reservations WHERE id=#{request.id};").first
      expect(res).to be(nil)
    end
  end

end
