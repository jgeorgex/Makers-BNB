class MbnbUser

attr_reader :surname

def self.create(email:, username:, firstname:, surname:, password:)
  @surname = "Bloggs"
end

end
