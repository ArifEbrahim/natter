require './lib/message.rb'

describe Message do
  describe '.all' do
    it 'returns all messages' do
      Message.create("This is my first peep!")
      Message.create("Second peep!")

      messages = Message.all

      expect(messages).to include('This is my first peep!')
      expect(messages).to include('Second peep!')
    end
  end

  describe '.create' do
    it 'creates a new message' do
      Message.create('Test peep')
      messages = Message.all

      expect(messages).to include('Test peep')
    end
  end
end