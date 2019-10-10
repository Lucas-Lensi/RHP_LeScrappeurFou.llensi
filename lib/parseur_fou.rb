require 'nokogiri'
require 'open-uri'
require 'pry'

def take_infos
  currencies = []
  prices = []
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  page.xpath("//a[@class='currency-name-container link-secondary']").each_with_index do |name, index|
    currencies[index] = name.text
  end
  begin
    page.xpath("//a[@class = 'price']").each_with_index do |value, index|
      prices[index] = value.text
    end
  rescue => e
    prices[index] = "unknown"
  end
  return make_hash(currencies, prices)
end

def make_hash (crypto_array, value_array)
  final_array = []
  i = 0
  while i < crypto_array.size
    final_array[i] = {crypto_array[i]=>value_array[i]}
    i += 1
  end
  puts final_array
  return final_array
end
take_infos
