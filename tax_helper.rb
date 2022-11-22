require "bigdecimal"
module TaxHelper
  IMPORT_DUTY_TAX = 0.05
  SALE_TAX = 0.10

  def calculate_total_tax(price, quantity, tax, imported)
    swedish_round(calculate_tax(price, quantity, imported, 'IMPORT_DUTY_TAX') +
                     calculate_tax(price, quantity, tax, 'SALE_TAX'))
  end

  private

  def calculate_tax(price, quantity, aplicable, type)
    aplicable ? ((price * TaxHelper.const_get(type)) * quantity) : 0.00
  end

  def round_to_nearest(value)
    (value * 20).round / 20.0
  end

  def swedish_round(value)
		return 0.0 if value == 0
		(value / 0.05).round * 0.05
  end
end

# Sales ending in 1–24 öre/øre round down to 0 öre.
# Sales ending in 25–49 öre/øre round up to 50 öre.
# Sales ending in 51–74 öre/øre round down to 50 öre.
# Sales ending in 75–99 öre/øre round up to the next whole krona.
