#require "products.txt"

module FileReader
  def read_file(file)
		begin
			file = File.open(file, "r")
			lines = []
			file.each_line { |line|
			  lines.push(line)
			}
			file.close
			return lines
		rescue
		  "Sorry, It was not possible to open the file with the file: #{file}"
		end
  end
end