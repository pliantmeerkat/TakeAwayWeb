feature 'Feature 5: Dev Mode Tools' do
  before(:each) do
    ENV['ENVIRONMENT'] = 'dev'
    visit('/')
  end
  after(:each)  { ENV['ENVIRONMENT'] = 'test'            }
  let(:connect) { PG.connect(dbname: 'TakeAwayWeb_test') }
  context 'Dev Tools on homepage' do
    scenario 'Dev Tools display on home page if dev env is active' do
      expect(page).to have_content('Developer')
    end
    scenario 'Dev tools not displayed if not dev' do
      ENV['ENVIRONMENT'] = 'test'
      visit('/')
      expect(page).to_not have_content('Developer')
    end
    scenario 'Clicking Dev button redirects to menu-create' do
      click_button('menu_create')
      expect(page).to have_content('Menu Maker')
    end
  end
  context 'Menu Maker' do
    before(:each) { click_button('menu_create') }
    scenario 'page displays correct elements' do
      expect(page).to have_content('Developer')
      expect(page).to have_content('Item Name')
      expect(page).to have_content('Item Price')
      expect(page).to have_content('Item Quantity')
      expect(page).to have_content('Add Item')
      expect(page).to have_content('Menu')
    end
    scenario 'user can add an item to the menu in db' do

    end
    scenario 'user can see updated menu displayed when items are added' do

    end
    scenario 'when items are added to menu, user can see them on home page' do

    end
  end
end
