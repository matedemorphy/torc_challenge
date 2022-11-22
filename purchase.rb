require './file_reader'
require './map_file_helper'
require './item'
require './format_helper'

class Purchase
  include FileReader
  include FormatHelper
  include MapFileHelper

  attr_accessor :input_number, :items, :details

  def initialize(input_number, _items = [], _details = [])
    @input_number = input_number
    @items = get_items
    @details = []
  end

  def get_items
    lines = read_file("input#{@input_number}.txt")

    create_list(lines).map do |line|
      Item.new(line[:name], line[:imported], line[:tax], line[:quantity], line[:price])
    end
  end

  def generate_receipt_item_list
    @items.each do |item|
      add_details(format_receipt_item_list(item.quantity, item.imported,	item.name, item.get_total_price))
    end
  end

  def generate_receipt_total_tax
    tax = calculate_total('get_total_tax')
    add_details(format_receipt_total_tax(tax))
  end

  def generate_receipt_total_sales
    total = calculate_total('get_total_price')
    add_details(format_receipt_total_sales(total))
  end

  def generate_receipt_details
    generate_receipt_item_list
    generate_receipt_total_tax
    generate_receipt_total_sales
    @details.unshift("Output #{@input_number}:")
    @details
  end

  private

  def add_details(detail)
    @details.push(detail)
  end

  def calculate_total(method)
    total = 0.00
    @items.each { |item| total += item.send(method) }
    total
  end
end
