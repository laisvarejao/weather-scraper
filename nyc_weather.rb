
require 'nokogiri'
require_relative 'url'

class NYCWeather

	def initialize
		@weather = fetch_weather
	end

	def parse_weather(content)
		weather = 0
		doc = Nokogiri::HTML(content)
		doc.xpath('//li[@id = "feed-main"]/div[@class = "info"]/strong[@class = "temp"]').each do |node|
		 	weather = node.text.tr('°', '').to_i
		end
		weather
	end

	def fetch_weather
		content = URL.open('http://www.accuweather.com/en/us/new-york-ny/10007/weather-forecast/349727')
		parse_weather(content)
	end

	def to_celsius
		(@weather - 32) * 5/9
	end

	def to_s
		puts "The weather today in New York is: #{@weather}° farenheit | #{to_celsius}° celsius!"
	end
end

NYCWeather.new.to_s