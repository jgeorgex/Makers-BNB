

class Property

attr_reader :id, :user_id, :name, :address, :description, :capacity, :pricepn

  def initialize( id:, user_id:, name:, address:, description:, capacity:, pricepn: )
    @id = id
    @user_id = user_id
    @name = name
    @address = address
    @capacity = capacity
    @description = description
    @pricepn = pricepn
  end


  def self.create( user_id:, address:, name:, description:, capacity:, pricepn: )  
    r = DatabaseConnection.query("INSERT INTO makersbnb_properties (user_id, address, name,
      description, capacity, pricepn) VALUES ('#{user_id}', '#{address}', '#{name}',
      '#{description}', '#{capacity}', '#{pricepn}') RETURNING id, user_id,
        address, description, capacity, pricepn;").first
    Property.new(id: r['id'], user_id: r['user_id'], name: r['name'], address: r['address'],
    description: r['description'], capacity: r['capacity'].to_i,
    pricepn: r['pricepn'])
  end

  def self.find(id)
    r = DatabaseConnection.query("SELECT * FROM makersbnb_properties WHERE id=#{id}")
    result = r.map { |p| Property.new(id: p['id'], user_id: p['user_id'], name: p['name'], address: p['address'],
    description: p['description'], capacity: p['capacity'].to_i,
    pricepn: p['pricepn'])}
    result.first
  end

  def self.user_all(id)
   r = DatabaseConnection.query("SELECT * FROM makersbnb_properties WHERE user_id=#{id}")
   r.map { |p| Property.new(id: p['id'], user_id: p['user_id'], name: p['name'], address: p['address'],
     description: p['description'], capacity: p['capacity'].to_i, pricepn: p['pricepn'])}
 end

 def self.all
   r = DatabaseConnection.query("SELECT * FROM makersbnb_properties")
   r.map { |p| Property.new(id: p['id'], user_id: p['user_id'], name: p['name'], address: p['address'],
     description: p['description'], capacity: p['capacity'].to_i, pricepn: p['pricepn'])}
 end
end
