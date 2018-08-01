require 'pg'

def setup_test_database
  p 'setting up test database...'
  connection = PG.connect(dbname: 'TakeAwayWeb_test')
  connection.exec('TRUNCATE menu_1;')
end
