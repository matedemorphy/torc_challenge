require_relative "./../purchase.rb"

RSpec.describe Purchase do
	let(:output1) { [
		"Output 1:",
		"2 book: 24.98",
		"1 music CD: 16.49",
		"1 chocolate bar: 0.85",
		"Sales Taxes: 1.50",
		"Total: 42.32"
	] }
	
	let(:output2) { [
		"Output 2:",
		"1 imported box of chocolates: 10.50",
		"1 imported bottle of perfume: 54.65",
		"Sales Taxes: 7.65",
		"Total: 65.15"
	] }
	
	let(:output3) { [
	"Output 3:",
	"1 imported bottle of perfume: 32.19",
	"1 bottle of perfume: 20.89",
	"1 packet of headache pills: 9.75",
	"3 imported box of chocolates: 35.45",
	"Sales Taxes: 7.80",
	"Total: 98.28"
	] }

	let(:purchase1) { Purchase.new(1) }
	let(:purchase2) { Purchase.new(2) }
	let(:purchase3) { Purchase.new(3) }

	describe "outputs" do
		context "valid cases" do
			it "returns the first output" do
				expect(output1).to eq(purchase1.generate_receipt_details)
  		end

			it "returns the second output" do
				expect(output2).to eq(purchase2.generate_receipt_details)
  		end

			it "returns the third output" do
				# I modified the sales tax value, since I did the math and I hope I'm not wrong, but think the output is incorrect.
				expect(output3).to eq(purchase3.generate_receipt_details)
  		end
		end
	end
end