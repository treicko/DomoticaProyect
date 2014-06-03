class LocalWeatherController < ApplicationController

	def show
		@location = Location.find(params[:location_id])
		@w_api= Wunderground.new("29c6ff4ca375144a")
		@weather_hash=@w_api.forecast_for(@location.country,@location.region, lang: 'SP')
		@weather_hash=@weather_hash["forecast"]["simpleforecast"]["forecastday"]
	end
=begin
	private
		def initialize
			#@w_api= Wunderground.new("29c6ff4ca375144a")
			#@weather_hash=@w_api.forecast_for("Bolivia","Cochabamba", lang: 'SP')
=end
end
