module TaxHelper
	IMPORT_DUTY_TAX = 0.05
	SALE_TAX = 0.10

	def calculate_total_tax(price, quantity, tax, imported)
		round_to_nearest(calculate_tax(price, quantity, imported, "IMPORT_DUTY_TAX") +
										 calculate_tax(price, quantity, tax, "SALE_TAX"))
	end

	private
	
	def calculate_tax(price, quantity, aplicable, type)
		aplicable ? ((price * (TaxHelper.const_get(type))) * quantity) : 0.00
	end

	def round_to_nearest(value)
		(value*20).round / 20.0
	end
end