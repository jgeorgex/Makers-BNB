require 'pg'

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
    connection = PG.connect(dbname: 'makers_bnb_test')
    r = connection.exec("INSERT INTO makersbnb_users (email, username, firstname,
      surname, password) VALUES ('#{email}', '#{username}', '#{firstname}',
        '#{surname}', '#{password}') RETURNING id, email, username, firstname,
        surname, password;")
        MbnbUser.new(id: r[0]['id'], email: r[0]['email'],
          username: r[0]['username'], firstname: r[0]['firstname'],
          surname: r[0]['surname'], password: r[0]['password'] )
    end
  end
