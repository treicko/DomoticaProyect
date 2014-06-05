class TemperaturesController < ApplicationController

  def get_time(present_time)
    if (time=Time.mktime(present_time.year,present_time.month,present_time.day,12,0,0))>present_time
        return "2014-05-28 16:00:00".to_datetime
    elsif (time=Time.mktime(present_time.year,present_time.month,present_time.day,12,0,0))<present_time and (time=Time.mktime(present_time.year,present_time.month,present_time.day,13,0,0))>present_time
        return "2014-05-28 12:00:00".to_datetime
     elsif (time=Time.mktime(present_time.year,present_time.month,present_time.day,13,0,0))<present_time and (time=Time.mktime(present_time.year,present_time.month,present_time.day,14,0,0))>present_time
        return "2014-05-28 13:00:00".to_datetime
     elsif (time=Time.mktime(present_time.year,present_time.month,present_time.day,14,0,0))<present_time and (time=Time.mktime(present_time.year,present_time.month,present_time.day,15,0,0))>present_time
        return "2014-05-28 14:00:00".to_datetime
     elsif (time=Time.mktime(present_time.year,present_time.month,present_time.day,15,0,0))<present_time and (time=Time.mktime(present_time.year,present_time.month,present_time.day,16,0,0))>present_time
        return "2014-05-28 15:00:00".to_datetime
     elsif (time=Time.mktime(present_time.year,present_time.month,present_time.day,16,0,0))<present_time
        return "2014-05-28 16:00:00".to_datetime
    end
  end

  def get_day(present_time)
    if present_time.hour<12
      day=present_time.wday-1
    end
    case day
        when 1 then
            return 'LUNES'
        when 2 then
            return 'MARTES'
        when 3 then
            return 'MIERCOLES'
        when 4 then
            return 'JUEVES'
        when 5 then
            return 'VIERNES'
        when 6 then
            return 'SABADO'
        when 7 then
            return 'DOMINGO'
    end
end

	def show_temperature_request
    @temperature_request = TemperatureRequest.new
    @thermostat = current_user.thermostats.where(serial_number: params[:serial_number]).last
    if @thermostat.configuration=="true"
      @temperature_request.status='OK'
      @temperature_request.temperature=@thermostat.temperature
    else
       @temperature_request.status='OK'
       present_time=Time.now
       day=get_day(present_time)
       time=get_time(present_time)
       @temperature_request.temperature= current_user.schedules.where(day: day).where(time: time).first.temperature
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

=begin
def get_day(present_time)
    if present_time.hour<12
      day=present_time.wday-1
    end
    case day
        when 1 then
            return 'LUNES'
        when 2 then
            return 'MARTES'
        when 3 then
            return 'MIERCOLES'
        when 4 then
            return 'JUEVES'
        when 5 then
            return 'VIERNES'
        when 6 then
            return 'SABADO'
        when 7 then
            return 'DOMINGO'
    end
=end

