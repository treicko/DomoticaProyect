class TemperaturesController < ApplicationController

	def edit
      @thermostat = Thermostat.find(params[:id])
	end
	
end
