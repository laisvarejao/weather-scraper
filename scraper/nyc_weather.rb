require 'nokogiri'

require './scraper/url'

class NYCWeather

	@weather

	def initialize
		fetch_weather
	end

	def fetch_weather
		content = URL.open('http://www.accuweather.com/en/us/new-york-ny/10007/weather-forecast/349727')
		parse_weather(content)
	end

	def parse_weather(content)
		doc = Nokogiri::HTML(content)
		doc.xpath('//li[@id = "feed-main"]/div[@class = "info"]/strong[@class = "temp"]').each do |node|
		 	@weather = node.text.tr('°', '').to_i
		end
	end

	def to_celsius
		(@weather - 32) * 5/9
	end

	def to_s
		"#{@weather}° fahrenheit - #{to_celsius}° celsius"
	end
end