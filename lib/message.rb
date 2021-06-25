require 'pg'

class Message
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'natter_test')
    else
      con = PG.connect(dbname: 'natter')
    end

    result = con.exec("SELECT * FROM messages;")
    result.map{ |message| message['text'] }

  end

  def self.create(text)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'natter_test')
    else
      con = PG.connect(dbname: 'natter')
    end

    con.exec("INSERT INTO messages (text) VALUES ('#{text}')")
  end 

end