require 'pg'
require_relative './database_connection'
require 'bcrypt'

class MbnbUser

  attr_reader :id, :email, :username, :firstname, :surname, :password

  def initialize(id:, email:, username:, firstname:, surname:, password:)
    @id = id
    @email = email
    @username = username
    @firstname = firstname
    @surname = surname
    @password = password
  end


  def self.create(email:, username:, firstname:, surname:, password:)
    encrypted_password = BCrypt::Password.create(password)
    r = DatabaseConnection.query("INSERT INTO makersbnb_users (email, username, firstname,
      surname, password) VALUES ('#{email}', '#{username}', '#{firstname}',
        '#{surname}', '#{encrypted_password}') RETURNING id, email, username, firstname,
        surname, password;")
        MbnbUser.new(id: r[0]['id'], email: r[0]['email'],
          username: r[0]['username'], firstname: r[0]['firstname'],
          surname: r[0]['surname'], password: r[0]['password'] )
  end

  def self.find(id)
    r = DatabaseConnection.query("SELECT * FROM makersbnb_users WHERE id=#{id}")
    result = r.map { |u| MbnbUser.new(id: u['id'], email: u['email'],
      username: u['username'], firstname: u['firstname'],
      surname: u['surname'], password: u['password'])}
    result.first
  end

  def self.authenticate(email, password)
    r = DatabaseConnection.query("SELECT * FROM makersbnb_users WHERE email='#{email}'")
    result = r.map { |u| MbnbUser.new(id: u['id'], email: u['email'],
      username: u['username'], firstname: u['firstname'],
      surname: u['surname'], password: u['password'])}
      my_password = BCrypt::Password.new(result.first.password)
      my_password == password ? true : false
  end
end
