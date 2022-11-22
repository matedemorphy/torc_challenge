# require "products.txt"

module FileReader
  def read_file(file)
    file = File.open(file, 'r')
    lines = []
    file.each_line do |line|
      lines.push(line)
    end
    file.close
    lines
  rescue StandardError
    "Sorry, It was not possible to open the file with the file: #{file}"
  end
end
