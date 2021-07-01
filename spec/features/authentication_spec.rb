# As a Maker
# So that only I can post messages on Chitter as me
# I want to log in to Chitter

# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter


feature 'authentication' do

  it 'a user can sign in' do
    User.create(full_name: 'Peter Rabbit', email: 'test@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content('Welcome, Peter Rabbit!')
  end


  scenario 'user enters incorrect email' do
    User.create(full_name: 'Peter Rabbit', email: 'test@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in(:email, with: 'wrong_email@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content('Welcome, Peter Rabbit!')
    expect(page).to have_content('Please check your email or password.')

  end

  scenario 'user enters incorrect password' do
    User.create(full_name: 'Peter Rabbit', email: 'test@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'wrong123')
    click_button('Sign in')

    expect(page).not_to have_content('Welcome, Peter Rabbit!')
    expect(page).to have_content('Please check your email or password.')
  end

  scenario 'a user can sign out' do
    User.create(full_name: 'Peter Rabbit', email: 'test@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')
    click_button('Sign out')

    expect(page).not_to have_content('Welcome, Peter Rabbit!')
    expect(page).to have_content('You have signed out.')
  end

end




