require 'nokogiri'
require 'open-uri'
require 'pry'

def get_depute_email (url)
  page = Nokogiri::HTML(open(url))
    email = page.xpath("/html/body/div/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a").text
    email == "" ? email = "unknown" : email
  return email
end

def get_depute_name (url)
  page = Nokogiri::HTML(open(url))
    name = page.xpath("/html/body/div/div[3]/div/div/div/section[1]/div/article/div[2]/h1").text
  return name
end

def get_depute_urls
  urls_array = []
  page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
  page.xpath("//div[@id='deputes-list']//li/a").each_with_index do |url, index|
    urls_array[index] = url['href']
  end
  return urls_array
end

def perform
  depute_first_name = []
  depute_last_name = []
  depute_email = []
  depute_hash = Hash.new
  urls_array = get_depute_urls
  urls_array.each_with_index do |url, index|
    depute_name = get_depute_name("http://www2.assemblee-nationale.fr#{url}").split(' ')
    depute_first_name[index] = depute_name[1]
    depute_last_name[index] = depute_name[2]
    depute_email[index] = get_depute_email("http://www2.assemblee-nationale.fr#{url}")
    puts depute_hash[index] = {"first_name" => depute_first_name[index], "last_name" => depute_last_name[index], "email" => depute_email[index]}
  end
  return depute_hash
end

perform
