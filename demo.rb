require_relative 'cart'
require_relative 'config'
require_relative 'item'
require_relative 'init'
require_relative 'main_application'
require_relative 'parser'

module ParserApp
  app = MainApplication.new('admin@admin.com', 'adminadmin', 'cart_data')

  cart = Cart.new


  base_url = 'https://www.gutenberg.org/ebooks/'
  ids =[84, 46, 1342, 2701, 1513, 145, 2641, 37106, 100, 67979]
  urls = ids.map { |id| "#{base_url}#{id}" }

  urls.each do |url|
    parsed_item = Parser.parse_item(url)
    next unless Config.condition.call parsed_item
    cart.add_item(parsed_item)
    puts parsed_item.to_s
  end

  cart.save_to_json(app.file_path)
  cart.save_to_csv(app.file_path)
end