# As a Maker
# So that only I can post messages on Chitter as me
# I want to log in to Chitter

RSpec.describe 'authentication' do
  feature 'authentication' do
    it 'a user can sign in' do
      User.create(full_name: 'Peter Rabbit', email: 'test@example.com', password: 'pasword123')

      visit '/sessions/new'
      fill_in(:email, with: 'test@example.com')
      fill_in(:password, with: 'password123')
      click_button('Sign in')
  
      expect(page).to have_content 'Welcome, Peter Rabbit!'
    end
  end


end