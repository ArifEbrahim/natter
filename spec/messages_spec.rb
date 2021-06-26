require './lib/message.rb'

describe Message do
  describe '.all' do
    it 'returns all messages' do
      Message.create(text: 'This is my first peep!')
      Message.create(text: 'Second peep!')

      messages = Message.all

      expect(messages).to include('This is my first peep!')
      expect(messages).to include('Second peep!')
    end
  end

  describe '.create' do
    it 'creates a new message' do
      Message.create(text: 'Test peep')
      messages = Message.all

      expect(messages).to include('Test peep')
    end
  end
end