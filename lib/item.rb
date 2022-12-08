class Item
  attr_accessor :page, :order_number

  def initialize(page, order_number)
    @page = page
    @order_number = order_number || 1
  end

  def info(&block)
    block.call
  end
end
