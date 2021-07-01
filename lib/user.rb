require 'bcrypt'
require './lib/database_connection.rb'

class User
  def self.create(full_name:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query("INSERT INTO users (full_name, email, password) VALUES ('#{full_name}', '#{email}', '#{encrypted_password}') RETURNING *;")
    User.new(id: result[0]['id'], full_name: result[0]['full_name'])
  end

  attr_reader :id, :full_name

  def initialize(id:, full_name:)
    @id = id
    @full_name = full_name    
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}';")
    User.new(id: result[0]['id'], full_name: result[0]['full_name'])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';")
    User.new(id: result[0]['id'], full_name: result[0]['full_name'])
  end

end
