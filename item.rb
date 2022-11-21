require "./tax_helper"

class Item
	include TaxHelper
	
	attr_accessor :quantity, :name, :imported, :tax, :price
	
	def initialize(name, imported, tax, quantity, price)
		@name = name
		@imported = imported
		@tax = tax
		@quantity = quantity.to_i
		@price = price.to_f
	end

	def get_total_tax
		calculate_total_tax(@price, @quantity, @tax, @imported)
	end

	def get_total_price
		(((@price * @quantity))+get_total_tax).round(2)
	end
end