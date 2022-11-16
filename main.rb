require "./file_reader"
require "./item"
require "./purchase"

include FileReader

read_file("input1.txt")
items = map_file
items_obj = []

items.each do |item|
	items_obj.push(Item.new(
		item[:name], 
		item[:imported], 
		item[:tax], 
		item[:quantity],
		item[:price]))
end

purchase = Purchase.new(items_obj)

puts purchase.generate_receipt_details