# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

feature 'viewing messages' do
  scenario 'a user can see messages' do
    Message.create('This is my first peep!')
    Message.create('Second peep!')
    Message.create('Third peep peeps!')

    visit('/messages')

    first_message = find('/html/body/ul/li[1]').text
    expect(first_message).to eq('Third peep peeps!')

    last_message = find('/html/body/ul/li[3]').text
    expect(last_message).to eq('This is my first peep!')
  end
end