require 'json'
require "csv"
require_relative './item_container'

class Cart
  include ClassMethods

  attr_reader :file_path, :file_name
  attr_accessor :items_list

  def initialize(file_path, file_name = 'export')
    @file_path = file_path
    @file_name = file_name
    @items_list = []
  end

  def save_to_file()
    File.write("#{@file_path}/#{@file_name}.txt", @items_list.to_s)
  end

  def save_to_json()
    File.write("#{@file_path}/#{@file_name}.json", @items_list.to_json)
  end

  def save_to_cvs()
    content = @items_list.map(&:values)
    File.write("#{@file_path}/#{@file_name}.csv", content.map(&:to_csv).join)
  end
end
