def sign_up
  visit('/users/new')
  fill_in('full_name', with: 'John Doe')
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'password123')
  click_button('Submit')
end