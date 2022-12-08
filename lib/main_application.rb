require 'rubygems'
require 'nokogiri'
require 'open-uri'

require_relative './item'
require_relative './parser'
require_relative './cart'

class MainApplication
  def initialize
    @page = Nokogiri::HTML(URI.open('https://rozetka.com.ua/ua/'))
    @item1 = Item.new(@page, 1)
    @item2 = Item.new(@page, 3)
  end

  def run
    cart = Cart.new('./', 'test_name')

    @item1.info do
      parser = Parser.new
      content = parser.parse_item(@item1)
      cart.add_item(content)
    end

    @item2.info do
      parser = Parser.new
      content = parser.parse_item(@item2)
      cart.add_item(content)
    end

    cart.delete_items([])
    cart.show_all_items
    cart.save_to_json
  end
end
