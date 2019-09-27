require_relative './database_connection'

class Reservation

  attr_reader :id, :property_id, :user_id, :res_date, :property, :guest

  def initialize(id:, property_id:, user_id:, res_date:)
    @id = id
    # @property_id = property_id
    # @user_id = user_id
    @res_date = res_date
    @property = Property.find(property_id)
    @guest = MbnbUser.find(user_id)
  end

  def self.create(property_id:, user_id:, res_date:)
    r = DatabaseConnection.query("INSERT into makersbnb_reservations (property_id, user_id, res_date) VALUES ('#{property_id}', '#{user_id}', '#{res_date}') RETURNING id, property_id, user_id, res_date;").first
    Reservation.new(id: r['id'].to_i, property_id: r['property_id'].to_i, user_id: r['user_id'].to_i, res_date: r['res_date'])
  end

  def self.find(property_id:, res_date:)
    r = DatabaseConnection.query("SELECT * FROM makersbnb_reservations WHERE property_id=#{property_id} AND res_date='#{res_date}';").first
    Reservation.new(id: r['id'].to_i, property_id: r['property_id'].to_i, user_id: r['user_id'].to_i, res_date: r['res_date'])
  end

  def self.find_guest(id)
    r = DatabaseConnection.query("SELECT * FROM makersbnb_reservations WHERE id=#{id};").first
    Reservation.new(id: r['id'].to_i, property_id: r['property_id'].to_i, user_id: r['user_id'].to_i, res_date: r['res_date'])
  end

  def self.all(property_id:)
    r = DatabaseConnection.query("SELECT res_date FROM makersbnb_reservations WHERE property_id=#{property_id} AND confirmed=TRUE;")
    r.map { |res| res['res_date']}
  end

  def self.requests(property_id:)
    r = DatabaseConnection.query("SELECT * FROM makersbnb_reservations WHERE property_id=#{property_id} AND confirmed=FALSE;")
    r.map { |res| Reservation.new(id: res['id'].to_i, property_id: res['property_id'].to_i, user_id: res['user_id'].to_i, res_date: res['res_date'])}
  end

  def self.confirm(res_id)
    DatabaseConnection.query("UPDATE makersbnb_reservations SET confirmed = 'TRUE' WHERE id=#{res_id};")
  end

  def self.deny(res_id)
    DatabaseConnection.query("DELETE FROM makersbnb_reservations WHERE id=#{res_id};")
  end

end
