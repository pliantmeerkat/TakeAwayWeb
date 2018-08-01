# this file contains variables for use in testing
# they will be used throught the tests for easy access in an effort to shortern
# spec file length and imrpove readablilty
# menu_1 - returns an array of hashes representing menu items
def menu_1
  [{ name: :Durain, price: 1200, quantity: 10 },
   { name: :Escargot, price: 1500, quantity: 9 },
   { name: :Offle, price: 2000, quantity: 10 },
   { name: :Asparagus, price: 900, quantity: 15 },
   { name: :Birdsnest, price: 2500, quantity: 4 }]
end

def test_dishes
  [['Durain', 1200, 10], ['Escargot', 1500, 9],
   ['Offle', 2000, 10],  ['Asparagus', 900, 15],
   ['Birdsnest', 2500, 4]]
end

def add_menu_to_test_db
  connection = PG.connect(dbname: 'TakeAwayWeb_test')
  test_dishes.length.times do |i|
    connection.exec('INSERT INTO menu_1 (item_name, item_price, item_quantity)'\
    "VALUES('#{test_dishes[i][0]}','#{test_dishes[i][1]}','#{test_dishes[i][2]}');")
  end
end

# database processor methods
