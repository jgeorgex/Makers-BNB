require 'reservation'

describe Reservation do
  describe '.create' do
    it "creates a new reservation" do
      result = Reservation.create(property_id: 4, user_id: 1, res_date: "#{Date.parse('25th Sep 2019')}")
      expect(result.user_id).to eq(1)
      expect(result).to be_a(Reservation)
    end
  end

  describe ".find" do
    it "returns reservation from db and wraps it in a reservation object" do
      Reservation.create(property_id: 4, user_id: 1, res_date: "#{Date.parse('25th Sep 2019')}")
      res = Reservation.find(property_id: 4, res_date: "#{Date.parse('25th Sep 2019')}")
      expect(res.property_id).to eq(4)
      expect(res).to be_a(Reservation)
    end
  end

  describe ".all" do
    it "returns all reservations for a given property" do
      Reservation.create(property_id: 4, user_id: 1, res_date: "#{Date.parse('25th Sep 2019')}")
      Reservation.create(property_id: 4, user_id: 5, res_date: "#{Date.parse('20th Sep 2019')}")
      Reservation.create(property_id: 4, user_id: 5, res_date: "#{Date.parse('22nd Sep 2019')}")

      res = Reservation.all(property_id: 4)
      expect(res.length).to eq(3)
    end
  end
end
