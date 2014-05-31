class LocalWeatherController < ApplicationController
	def initialize
		@w_api= Wunderground.new("29c6ff4ca375144a")
	end
end
