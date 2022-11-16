require_relative "./../file_reader.rb"

RSpec.describe FileReader do
	include FileReader
	let(:friendly_message) { "Sorry, It was not possible to open the file with the file: " }
	let(:invalid_file) { "invalid_file.txt" }
	let!(:read_file_error_message) { read_file(invalid_file) }
	
	describe "file" do
		context "invalid cases" do
			it "Prints friendly message if the file was not found or could not be opened." do
				expect("#{friendly_message}#{invalid_file}").to eq(read_file_error_message)
  		end
		end
	end
end