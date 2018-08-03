# Order class
class Order

  attr_reader :item_list, :total_charge

  def self.instance
    @order
  end

  def self.create
    @order = Order.new
  end

  def initialize
    @item_list = []
    @total_charge = 0
  end

  def add_item_to_list(item)
    @item_list << item
    amend_total
  end

  def rm_item_from_list(item)
    raise 'Not in list' if @item_list.count(item).zero?
    @item_list.delete(item)
    amend_total
  end

  def amend_total
    @total_charge = 0
    item_list.each { |i| @total_charge += (i[:price]) }
  end
end
