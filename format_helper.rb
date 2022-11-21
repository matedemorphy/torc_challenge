module FormatHelper
	def format_receipt_total_tax(tax)
		"Sales Taxes: #{'%.2f' % tax}"
	end
	
	def format_receipt_total_sales(total)
		"Total: #{total}"
	end
	
	def format_receipt_item_list(quantity, imported, name, total_price)
		[
			"#{quantity}",
			(imported ? " imported " : " "),
			"#{name}: ",
			'%.2f' % total_price
		].join
	end
end