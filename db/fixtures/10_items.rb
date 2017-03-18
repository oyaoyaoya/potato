(1...200).each do |i|
  item_status = [0, 1, 2, 3, 4]
  c = i % 98 + 1
  textbook = Textbook.find(c)
  Item.seed do |item|
    item.seller_id = c
    item.id = i
    item.name = textbook.name
    item.price = textbook.price
    item.status = item_status.sample
    item.textbook_id = c
    item.course_id =textbook.course_id
  end
end
