class Parser
  def parse_item(item)

    elements = item.page.css('#gallerywide > li')
    selected_item = elements[item.order_number]
    title = selected_item.css('.normal > a > strong').text
    location = selected_item.css('.date-location li')[1].text
    price = selected_item.css('.price').text.strip!
    time = /([0-9]?[0-9]?|2?[0-3]):?[0-5]?[0-9]/.match(location)

    [
      ['title', title],
      ['price', price],
      ['time', time.to_s]
    ].to_h
  end
end
