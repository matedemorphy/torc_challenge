class Purchase
	attr_accessor :items, :details
	
	def initialize(items, details=[])
		@items = items
		@details = details
	end

	def generate_receipt_item_list
		@items.each do |item|
			@details.push([
				"#{item.quantity}",
				(item.imported ? " imported " : " "),
				"#{item.name}: ",
				item.calculate_total_price
				
			].join)
		end
	end

	def generate_receipt_total_tax
		tax = 0
		@items.each do |item|
			tax += item.calculate_total_tax
		end
		@details.push([
			"Sales Taxes: #{tax}"
		])
	end

	def generate_receipt_total_sales
		total = 0
		@items.each do |item|
			total += item.calculate_total_price
		end
		@details.push([
			"Total: #{total}"
		])
	end

	def generate_receipt_details
		generate_receipt_item_list
		generate_receipt_total_tax
		generate_receipt_total_sales
		@details
	end
end