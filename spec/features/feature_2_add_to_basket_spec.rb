feature 'Feature 2: user can add item to basket' do
  before(:each) do
    add_menu_to_test_db
    visit('/')
  end
  scenario 'Basket exists' do
    expect(page).to have_content('Basket')
  end
  scenario 'Basket is empty when no order' do
    expect(page).to have_content('Basket: £0.00')
  end
  scenario 'Items can be added to basket' do
    # will throw error if not there
    click_button('Durain')
  end
  scenario 'Adding an item updates basket' do
    click_button('Durain')
    expect(page).to have_content('Basket: £12.00')
  end
end
