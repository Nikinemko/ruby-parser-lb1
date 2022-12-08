module ClassMethods
  def self.included(_base)
    # Initialize module.
  end
end

module InstanceMethods
  def add_item(content)
    items_list.push(content)
  end

  def remove_item(index)
    items_list.delete_at(index)
  end

  def delete_items(indexes)
    self.items_list = items_list.reject.with_index { |_v, i| indexes.include?(i) }
  end

  def method_missing(method_name, *_args)
    puts "method_missing #{method_name}"
  end

  def respond_to_missing?(method_name, include_private = false)
    method_name || super
  end

  def show_all_items
    puts items_list
  end
end
