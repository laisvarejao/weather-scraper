require './scraper/nyc_weather'

get "/" do
  @nyc_weather = NYCWeather.new.to_s
  erb :index
end