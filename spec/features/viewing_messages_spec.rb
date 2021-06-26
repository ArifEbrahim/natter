feature 'viewing messages' do
  # As a maker
  # So that I can see what others are saying  
  # I want to see all peeps in reverse chronological order

  scenario 'a user can see messages' do
    Message.create(text: 'This is my first peep!')
    Message.create(text: 'Second peep!')
    Message.create(text: 'Third peep peeps!')

    visit('/messages')

    first_message = find('/html/body/ul/li[1]').text
    expect(first_message).to eq('Third peep peeps!')

    last_message = find('/html/body/ul/li[3]').text
    expect(last_message).to eq('This is my first peep!')
  end

  # As a Maker
  # So that I can better appreciate the context of a peep
  # I want to see the time at which it was made

  # scenario 'a user can see the time at which message was created' do
  #   Message.create("This is my first peep!", "Bob", "13:00 01/01/2021")

  #   visit('/chitter')
  #   expect(page).to have_content("13:00 01/01/2021 - Bob - This is my first peep!")  
end