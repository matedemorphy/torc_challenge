require "./purchase"

def generate_output(input_number)
	purchase = Purchase.new(input_number)
	purchase.generate_receipt_details
end

def print_outputs
	puts generate_output(1)
	puts "------------------------------"
	puts generate_output(2)
	puts "------------------------------"
	puts generate_output(3)
end

print_outputs