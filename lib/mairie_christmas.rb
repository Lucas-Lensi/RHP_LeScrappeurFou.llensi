require 'nokogiri'
require 'open-uri'
require 'pry'

def get_townhall_email (url)
  page = Nokogiri::HTML(open(url))
    email = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
    email == "" ? email = "unknown" : email
  return email
end

def get_townhall_urls
  urls_array = []
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise"))
  page.xpath("//a[@class='lientxt']").each_with_index do |url, index|
    urls_array[index] = url['href'].reverse.chomp('.').reverse
  end
  return urls_array
end

def get_city_name
  city_name_array = []
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise"))
  page.xpath("//a[@class='lientxt']").each_with_index do |name, index|
    city_name_array[index] = name.text
  end
  return city_name_array
end

def make_hash (all_name, all_email)
  final_array = []
  i = 0
  while i < all_name.size
    final_array[i] = {all_name[i]=>all_email[i]}
    i += 1
  end
  puts final_array
  return final_array
end

def perform
  email_array = []
  urls_array = get_townhall_urls
  city_name_array = get_city_name
  urls_array.each_with_index do |url, index|
    email_array[index] = get_townhall_email("https://www.annuaire-des-mairies.com#{url}")
  end
  final_hash = make_hash(city_name_array, email_array)
  puts final_hash
  return final_hash
end

perform
