feature 'Feature 1: List of dishes with prices' do
  scenario 'Can load database menu and display on page' do
    connection = PG.connect(dbname: 'TakeAwayWeb_test')
    test_dishes = [['Durain', 1200, 10], ['Escargot', 1500, 9],
                   ['Offle', 2000, 10],  ['Asparagus', 900, 15],
                   ['Birds nest', 2500, 4]]
    test_dishes.length.times do |i|
      connection.exec('INSERT INTO menu_1 (item_name, item_price, item_quantity)'\
      "VALUES('#{test_dishes[i][0]}','#{test_dishes[i][1]}','#{test_dishes[i][2]}');")
    end
    visit('/')
    test_dishes.each { |dish| expect(page).to have_content(dish) }
  end
end
