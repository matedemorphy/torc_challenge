module FormatHelper
  def format_receipt_total_tax(tax)
    "Sales Taxes: #{two_decimals(tax)}"
  end

  def format_receipt_total_sales(total)
    "Total: #{two_decimals(total)}"
  end

  def format_receipt_item_list(quantity, imported, name, total_price)
    [
      quantity.to_s,
      (imported ? ' imported ' : ' '),
      "#{name}: ",
      two_decimals(total_price)
    ].join
  end

	private 
	
	def two_decimals(value)
		'%.2f' % value
	end
end

#Sales ending in 1–24 öre/øre round down to 0 öre.
#Sales ending in 25–49 öre/øre round up to 50 öre.
#Sales ending in 51–74 öre/øre round down to 50 öre.
#Sales ending in 75–99 öre/øre round up to the next whole krona.
