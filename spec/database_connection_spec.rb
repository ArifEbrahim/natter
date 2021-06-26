require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'natter_test')

      DatabaseConnection.setup('natter_test')
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('natter_test')
  
      expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")
  
      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end
end