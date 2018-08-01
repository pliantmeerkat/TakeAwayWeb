# database processing class
class DbProcessor

  attr_reader :connector

  def initialize(db_name)
    @connector = PG.connect(dbname: db_name)
  end

  def read_from_db(query='*')
    begin
      data = @connector.exec "SELECT #{query} FROM menu_1;"
    ensure @connector.close if @connector
    end
    format_sql_query(data)
  end

  def add_to_db(data)
    # note will only currently work with menu currently - must be formatted correctly
    data.length.times do |i|
      @connector.exec('INSERT INTO menu_1 (item_name, item_price, item_quantity)'\
      "VALUES('#{data[i][0]}','#{data[i][1]}','#{data[i][2]}');")
    end
  end

  def rm_from_db

  end

  private

  def format_sql_query(table)
    data = []
    table.each do |row|
      data.push(name: row['item_name'].to_sym,
                price: row['item_price'].to_i,
                quantity: row['item_quantity'].to_i)
    end
    data
  end
end
