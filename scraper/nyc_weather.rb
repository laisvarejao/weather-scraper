require 'nokogiri'

require './scraper/url'

class NYCWeather

	def initialize
		fetch_weather
	end

	def fetch_weather
		content = URL.open('http://www.accuweather.com/en/us/new-york-ny/10007/weather-forecast/349727')
		parse_weather(content)
	end

	def parse_weather(content)
		doc = Nokogiri::HTML(content)
		doc.xpath('//*[@id="feed-tabs"]/ul/li[1]/div/div[2]/div/span[1]').each do |node|
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
