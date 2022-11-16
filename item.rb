class Item
	
	attr_accessor :quantity, :name, :imported, :tax, :price
	
	def initialize(name, imported, tax, quantity, price)
		@name = name
		@imported = imported
		@tax = tax
		@quantity = quantity.to_i
		@price = price.to_f
	end

	def calculate_import_duty_tax
		@imported ? ((@price * 0.05) * @quantity) : 0.0
	end

	def calculate_sale_tax
		@tax ? ((@price * 0.1) * @quantity) : 0.0
	end

	def calculate_total_tax
		(calculate_sale_tax + calculate_import_duty_tax)
	end

	def calculate_total_price
		(@price * @quantity)
	end
end