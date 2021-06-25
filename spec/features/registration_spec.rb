# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('full_name', with: 'John Doe')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content "Welcome, John Doe"
  end
end