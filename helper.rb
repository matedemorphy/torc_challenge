module Helper
	def parse_float(value)
		value.to_f
	end

	def round_to_nearest(value)
		(value*20).round / 20.0
	end

	def calculate_import_duty_tax(price, quantity)
		(price * 0.05) * quantity
	end

	def calculate_sale_tax(price, quantity)
		(price * 0.10) * quantity
	end

	def calculate_total_tax(sale_tax, import_duty_tax)
		round_to_nearest((get_sale_tax + get_import_duty_tax))
	end
end