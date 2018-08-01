feature 'Feature 1: List of dishes with prices' do
  before(:each) { add_menu_to_test_db }
  scenario 'Can load database menu and display on page' do
    visit('/')
    menu_1.each do |item|
      expect(page).to have_content(item[:name])
      expect(page).to have_content(item[:price])
    end
  end
end
