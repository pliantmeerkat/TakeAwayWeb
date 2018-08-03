feature 'Feature 3: User can remove items from basket' do
  before(:each) do
    add_menu_to_test_db
    visit('/')
    click_button('item0')
  end
  scenario 'An item in basket can be removed crrectly' do
    expect(page).to have_content('Basket: £12.00')
    click_button('Rm0')
    expect(page).to have_content('Basket: £0.00')
  end
  scenario 'Two of the same items can be removed' do
    click_button('item0')
    click_button('Rm1')
    expect(page).to have_content('Basket: £0.00')
  end
end
