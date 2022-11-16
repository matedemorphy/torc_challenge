require "./file_reader"
require "./item"

class Purchase
	include FileReader
	
	attr_accessor :input_number, :items, :details
	
	def initialize(input_number, items = [], details=[])
		@input_number = input_number
		@items = get_items
		@details = []
	end

	def get_items
		read_file("input#{@input_number}.txt")
		#a = read_file("input#{@input_number}.txt")
		#if a.is_a? String
		#	abort a
		#end
		items_file = map_file
		items_obj = []
		
		items_file.each do |item|
			items_obj.push(Item.new(
				item[:name], 
				item[:imported], 
				item[:tax], 
				item[:quantity],
				item[:price]))
		end
		
		items_obj
	end

	def generate_receipt_item_list
		@items.each do |item|
			@details.push([
				"#{item.quantity}",
				(item.imported ? " imported " : " "),
				"#{item.name}: ",
				'%.2f' % item.get_total_price
			].join)
		end
	end

	def generate_receipt_total_tax
		tax = 0.00
		@items.each do |item|
			tax += item.get_total_tax
		end
		@details.push(
			"Sales Taxes: #{'%.2f' % tax}"
		)
	end

	def generate_receipt_total_sales
		total = 0.00
		@items.each do |item|
			total += item.get_total_price
		end
		@details.push(
			"Total: #{total}"
		)
	end

	def generate_receipt_details
		generate_receipt_item_list
		generate_receipt_total_tax
		generate_receipt_total_sales
		@details.unshift("Output #{@input_number}:")
		@details
	end
end