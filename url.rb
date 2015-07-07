require 'net/http'
require 'uri'

module URL

	def self.open(url)
		Net::HTTP.get(URI.parse(url))
	end
end
