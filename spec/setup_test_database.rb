require 'pg'

def setup_test_database
  con = PG.connect(dbname: 'natter_test')
  con.exec("TRUNCATE users;")
end