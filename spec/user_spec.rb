require './lib/user.rb'

RSpec.describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(full_name: 'Peter Rabbit', email: 'test@example.com', password: 'pasword123')

      persisted_data = PG.connect(dbname: 'natter_test').query("SELECT * FROM users WHERE id = #{user.id};")

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.full_name).to eq('Peter Rabbit')
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
  
      User.create(full_name: 'Peter Rabbit', email: 'test@example.com', password: 'password123')
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(full_name: 'Peter Rabbit', email: 'test@example.com', password: 'pasword123')
      result = User.find(user.id)
  
      expect(result.id).to eq user.id
      expect(result.full_name).to eq user.full_name
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user if one exists' do
      user = User.create(full_name: 'Peter Rabbit', email: 'test@example.com', password: 'pasword123')
      authenticated_user = User.authenticate(email: 'test@example.com', password: 'pasword123' )

      expect(authenticated_user.id).to eq(user.id)
    end
  end

end