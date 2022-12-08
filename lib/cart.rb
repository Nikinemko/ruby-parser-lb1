require 'json'
require_relative './item_container'

class Cart
  include ClassMethods
  include InstanceMethods

  attr_reader :file_path, :file_name
  attr_accessor :items_list

  def initialize(file_path, file_name = 'export')
    @file_path = file_path
    @file_name = file_name
    @items_list = []
  end

  def save_to_file()
    # convert to string
    File.write("#{@file_path}/#{@file_name}.txt", @items_list)
  end

  def save_to_json()
    # convert to json
    File.write("#{@file_path}/#{@file_name}.json", @items_list.to_json)
  end

  def save_to_cvs()
    # convert to csv
    File.write("#{@file_path}/#{@file_name}.csv", @items_list)
  end
end
