require_relative 'item_container'
require 'json'
require 'csv'

class Cart
  include ItemContainer
  
  attr_accessor :items

  def initialize
    @items = []
  end

  def save_to_file(file_name, file_ext, content)
    File.open("#{file_name}#{file_ext}", 'w') do |file|
      file.puts(content)
    end
    puts "Saved to #{file_name}"
  end

  def save_to_json(file_name)
    json_data = @items.map(&:as_json)
    save_to_file(file_name, '.json', JSON.pretty_generate(json_data))
  end

  def save_to_csv(file_name)
    csv_data = [@items.first.as_json.keys.join(',')] +
               @items.map { |item| item.as_json.values.join(',') }
    save_to_file(file_name, '.csv', csv_data.join("\n"))
  end
end
