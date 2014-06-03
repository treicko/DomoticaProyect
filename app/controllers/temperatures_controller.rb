class TemperaturesController < ApplicationController

	def show_temperature_request
    @temperature_request = TemperatureRequest.new
    @thermostat = current_user.thermostats.where(serial_number: params[:serial_number]).last
    if @thermostat.configuration
      @temperature_request.status='OK'
      @temperature_request.temperature=@thermostat.temperature
    else
       @temperature_request.status='OK'
       
    end
    respond_to do |format|
      format.json {render json: @temperature_request}
    end
  end

	
end


class TemperatureRequest
  def initialize
    @status= 'Error!'
    @temperature= 'Error'
  end
  
  attr_accessor :status, :temperature
end
