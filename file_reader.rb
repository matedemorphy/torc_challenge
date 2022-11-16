#require "products.txt"

module FileReader
  def read_file(file)
		file = File.open(file, "r")
		@lines = []
		file.each_line { |line|
		  @lines.push(line)
		}
		file.close
  end

	def get_quantity(line)
		line.split.first
	end

	def get_name(line)
		line.split.delete_if {
			|el| true if Float(el) rescue false or 
			el == "imported" or 
			el == "at" }.join(" ")
	end

	def imported?(line)
		line.match(/imported/) ? true : false
	end

	def tax?(line)
		(line.match(/music/) or line.match(/perfume/)) ? true : false
	end

	def get_price(line)
		line.split.last
	end

	def map_file
		list = []
		@lines.each do |line|
			list.push(
				{
					:quantity => get_quantity(line),
					:name => get_name(line),
					:imported => imported?(line), 
					:tax => tax?(line), 
					:price => get_price(line)
				}
			)
		end
		return list
	end
end