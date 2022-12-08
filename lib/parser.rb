class Parser
  def parse_item(item)
    # puts item.order_number
    # parse via nokogiri selected item instance
    [
      ['image', 'url'],
      ['title', 'amigos'],
      ['price', '30$']
    ].to_h
  end
end
