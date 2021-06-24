require './lib/message.rb'

describe Message do
  describe '.all' do
    it 'returns all messages' do
      messages = Message.all

      expect(messages).to include('This is my first peep!')
      expect(messages).to include('Second peep!')
    end
  end
end