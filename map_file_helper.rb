module MapFileHelper
  def get_quantity(line)
    line.split.first
  end

  def get_name(line)
    line.split.delete_if do |el|
      begin
             true if Float(el)
      rescue StandardError
        false or
          el == 'imported' or
          el == 'at'
           end
    end .join(' ')
  end

  def imported?(line)
    line.match(/imported/) ? true : false
  end

  def tax?(line)
    line.match(/music/) || line.match(/perfume/) ? true : false
  end

  def get_price(line)
    line.split.last
  end

  def create_list(lines)
    list = []
    lines.each do |line|
      list.push(
        {
          quantity: get_quantity(line),
          name: get_name(line),
          imported: imported?(line),
          tax: tax?(line),
          price: get_price(line)
        }
      )
    end
    list
  end
end
