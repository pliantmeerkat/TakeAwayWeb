feature 'Placing an order' do
  context 'Order' do
    before(:each) do
      add_menu_to_test_db
      visit('/')
      click_button('Durain')
      click_button('Checkout')
    end
    scenario 'An order can be made by the user' do
      expect(page).to have_content('Durain')
      expect(page).to have_content('Total: £12.00')
      expect(page).to have_content('Thank you for your order!')
      click_button('Back') # to check if program reloads with empty basket
      expect(page).to have_content('Basket: £0.00')
    end
    scenario 'Db stock levels are adjusted after order' do
      connection = PG.connect(dbname: 'TakeAwayWeb_test')
      result = connection.exec("SELECT item_quantity FROM menu_1 WHERE item_name LIKE ('Durain');")
      new_quant=  result.map { |quant| quant.values }.join.to_i
      expect(new_quant).to eq(test_dishes[0][2])
    end
  end
end