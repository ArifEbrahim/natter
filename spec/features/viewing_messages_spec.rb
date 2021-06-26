feature 'viewing messages' do
  # As a maker
  # So that I can see what others are saying  
  # I want to see all peeps in reverse chronological order

  scenario 'users can see messages in reverse chronological order' do
    sign_up

    Message.create(text: 'This is my first peep!', time_stamp: '13:00 01/01/2021')
    Message.create(text: 'Second peep!', time_stamp: '14:00 02/02/2021')
    Message.create(text: 'Third peep peeps!', time_stamp: '15:00 03/03/2021')

    visit('/messages')

    first_message = find('/html/body/ul/li[1]').text
    expect(first_message).to eq('15:00 03/03/2021 - Third peep peeps!')

    last_message = find('/html/body/ul/li[3]').text
    expect(last_message).to eq('13:00 01/01/2021 - This is my first peep!')
  end

  # As a Maker
  # So that I can better appreciate the context of a peep
  # I want to see the time at which it was made

  scenario 'users can see the time at which a message was created' do
    sign_up
    
    Message.create(text: "This is my first peep!", time_stamp: "13:00 01/01/2021")

    visit('/messages')
    expect(page).to have_content("13:00 01/01/2021 - This is my first peep!")  
  end

  # scenario 'users can see the name of the person who posted' do
  #   Message.create(text: "This is my first peep!", time_stamp: "13:00 01/01/2021")

  #   visit('/messages')
  #   expect(page).to have_content("13:00 01/01/2021 - This is my first peep!")  
  # end
end