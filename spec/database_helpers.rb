def persisted_data(id:)
  con = PG.connect(dbname: 'natter_test')
  result = con.exec("SELECT * FROM messages WHERE id = #{id};")
  result.first
end