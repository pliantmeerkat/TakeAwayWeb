require 'pg'
# menu class
class Menu

  attr_reader :menu

  def initialize(db_processor)
    @db_processor = db_processor
    create_menu
  end

  def create_menu
    @menu = @db_processor.read_from_db
  end

end
