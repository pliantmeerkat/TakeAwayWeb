require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'TakeAwayWeb_test')
  connection.exec('TRUNCATE menu_1;')
end
