# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature 'Posting a new message' do
  scenario 'user can post a message on natter' do
    sign_up
    
    visit('/messages/new')
    fill_in('text', with: 'This is my first peep!')
    click_button('Submit')
    expect(page).to have_content('This is my first peep!')
  end

  scenario 'Users cannot post a message without signing in' do
    visit('/messages/new')
    expect(page).to have_content('Please sign up to post a peep')
  end

end