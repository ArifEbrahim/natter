require 'bcrypt'

class User
  def self.create(full_name:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)

    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'natter_test')
    else
      con = PG.connect(dbname: 'natter')
    end

    result = con.exec("INSERT INTO users (full_name, email, password) VALUES ('#{full_name}', '#{email}', '#{encrypted_password}') RETURNING *;")
    User.new(id: result[0]['id'], full_name: result[0]['full_name'])
  end

  attr_reader :id, :full_name

  def initialize(id:, full_name:)
    @id = id
    @full_name = full_name    
  end

  def self.find(id)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'natter_test')
    else
      con = PG.connect(dbname: 'natter')
    end

    return nil unless id
    result = con.exec("SELECT * FROM users WHERE id = '#{id}';")
    User.new(id: result[0]['id'], full_name: result[0]['full_name'])
  end

end
