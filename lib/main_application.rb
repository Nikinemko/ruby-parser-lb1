require 'rubygems'
require 'nokogiri'
require 'open-uri'

require_relative './item'
require_relative './parser'
require_relative './cart'

class MainApplication
  def initialize
    @page = Nokogiri::HTML(URI.open('https://www.olx.ua/'))
    @item1 = Item.new(@page, 1)
    @item2 = Item.new(@page, 3)
  end

  def run
    cart = Cart.new('./', 'test_name')
    parser = Parser.new

    @item1.info do
      content = parser.parse_item(@item1)
      cart.add_item(content)
    end

    @item2.info do
      content = parser.parse_item(@item2)
      cart.add_item(content)
    end

    # cart.delete_items([1])
    # cart.remove_item(0)
    cart.show_all_items
    cart.save_to_json
    cart.save_to_file
    cart.save_to_cvs
  end
end
