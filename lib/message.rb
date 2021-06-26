require 'pg'

class Message
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'natter_test')
    else
      con = PG.connect(dbname: 'natter')
    end

    result = con.exec("SELECT * FROM messages;")
    display = result.map do |message|
      Message.new(text: message['text'], time_stamp: message['time_stamp'], id: message['id'])
    end
    display.reverse

  end

  def self.create(text:, time_stamp:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'natter_test')
    else
      con = PG.connect(dbname: 'natter')
    end

    result = con.exec("INSERT INTO messages (text, time_stamp) VALUES ('#{text}', '#{time_stamp}') RETURNING *;")
    Message.new(text: result[0]['text'], time_stamp: result[0]['time_stamp'], id: result[0]['id'])
  end 

  attr_reader :text, :time_stamp, :id

  def initialize(text:, time_stamp:, id:)
    @text = text
    @time_stamp = time_stamp
    @id = id
  end

end