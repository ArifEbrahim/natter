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
      Message.new(text: message['text'], time_stamp: message['time_stamp'], id: message['id'], full_name: message['full_name'])
    end
    display.reverse

  end

  def self.create(text:, time_stamp:, full_name:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'natter_test')
    else
      con = PG.connect(dbname: 'natter')
    end

    result = con.exec("INSERT INTO messages (text, time_stamp, full_name) VALUES ('#{text}', '#{time_stamp}', '#{full_name}') RETURNING *;")
    Message.new(text: result[0]['text'], time_stamp: result[0]['time_stamp'], id: result[0]['id'], full_name: result[0]['full_name'])
  end 

  attr_reader :text, :time_stamp, :id, :full_name

  def initialize(text:, time_stamp:, id:, full_name:)
    @text = text
    @time_stamp = time_stamp
    @id = id
    @full_name = full_name
  end

end