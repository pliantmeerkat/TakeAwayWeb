feature 'Feature 2: user can add item to basket' do
  before(:each) { visit('/') }
  scenario 'Basket exists' do
    expect(page).to have_content('Basket')
  end
  scenario 'Basket is empty when no order' do
    expect(page).to have_content('Basket: £0.00')
  end
  scenario 'Items can be added to basket' do
    expect(page).to have_content('Add')
    click_button('Add_item_1')
  end
  scenario 'Adding an item updates basket' do
    expect(page).to have_content('Basket: £12.00')
    expect(page).to have_content('1 Item in basket')
  end
end
