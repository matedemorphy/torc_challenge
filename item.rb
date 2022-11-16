require "./helper"

class Item
	include Helper
	
	attr_accessor :quantity, :name, :imported, :tax, :price
	
	def initialize(name, imported, tax, quantity, price)
		@name = name
		@imported = imported
		@tax = tax
		@quantity = quantity.to_i
		@price = price.to_f
	end

	def get_import_duty_tax
		@imported ? calculate_import_duty_tax(@price, @quantity) : 0.00
	end

	def get_sale_tax
		@tax ? calculate_sale_tax(@price, @quantity) : 0.00
	end

	def get_total_tax
		calculate_total_tax(get_sale_tax, get_import_duty_tax)
	end

	def get_total_price
		(((@price * @quantity))+get_total_tax).round(2)
	end
end