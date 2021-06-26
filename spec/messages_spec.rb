require './lib/message.rb'
require 'database_helpers'

describe Message do
  describe '.all' do
    it 'returns a list of messages' do
      Message.create(text: 'This is my first peep!', time_stamp: '13:00 01/01/2021', full_name: 'John Doe')
      Message.create(text: 'Second peep!', time_stamp: '14:00 02/02/2021', full_name: 'John Doe')
      message = Message.create(text: 'Third peep peeps!', time_stamp: '15:00 03/03/2021', full_name: 'John Doe')

      messages = Message.all

      expect(messages.length).to eq(3)
      expect(messages.first).to be_a(Message)
      expect(messages.first.id).to eq(message.id)
      expect(messages.first.text).to eq('Third peep peeps!')
      expect(messages.first.time_stamp).to eq('15:00 03/03/2021')
      expect(messages.first.full_name).to eq('John Doe')
   
    end
  end

  describe '.create' do
    it 'creates a new message' do
      message = Message.create(text: 'Test peep', time_stamp: '13:00 01/01/2021', full_name: 'John Doe')
      persisted_data = persisted_data(id: message.id)

      expect(message).to be_a(Message)
      expect(message.id).to eq(persisted_data['id'])
      expect(message.text).to eq('Test peep')
      expect(message.time_stamp).to eq('13:00 01/01/2021')
      expect(message.full_name).to eq('John Doe')
    end
  end
end