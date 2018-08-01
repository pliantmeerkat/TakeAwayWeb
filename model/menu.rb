require 'pg'
# menu class
class Menu

  attr_reader :menu

  def initialize(menu)
    create_menu
  end

  def create_menu
    begin
      @menu = []
      connection = PG.connect(dbname: 'TakeAwayWeb_test')
      table = connection.exec 'SELECT * FROM menu_1;'
      format_menu(table)
    end
  ensure connection.close if connection
  end

  def format_menu(table)
    table.each do |row|
      @menu.push(name: row['item_name'].to_sym,
                 price: row['item_price'].to_i,
                 quantity: row['item_quantity'].to_i)
    end
  end

end
