class TemperaturesController < ApplicationController

  def get_time(present_time)
    if (time=Time.mktime(present_time.year,present_time.month,present_time.day,16,0,0))>present_time
        return "2014-05-28 20:00:00".to_datetime
    elsif (time=Time.mktime(present_time.year,present_time.month,present_time.day,16,0,0))<present_time and (time=Time.mktime(present_time.year,present_time.month,present_time.day,17,0,0))>present_time
        return "2014-05-28 16:00:00".to_datetime
     elsif (time=Time.mktime(present_time.year,present_time.month,present_time.day,17,0,0))<present_time and (time=Time.mktime(present_time.year,present_time.month,present_time.day,18,0,0))>present_time
        return "2014-05-28 17:00:00".to_datetime
     elsif (time=Time.mktime(present_time.year,present_time.month,present_time.day,18,0,0))<present_time and (time=Time.mktime(present_time.year,present_time.month,present_time.day,19,0,0))>present_time
        return "2014-05-28 18:00:00".to_datetime
     elsif (time=Time.mktime(present_time.year,present_time.month,present_time.day,19,0,0))<present_time and (time=Time.mktime(present_time.year,present_time.month,present_time.day,20,0,0))>present_time
        return "2014-05-28 19:00:00".to_datetime
     elsif (time=Time.mktime(present_time.year,present_time.month,present_time.day,20,0,0))<present_time
        return "2014-05-28 20:00:00".to_datetime
    end
  end

  def get_day(present_time)
    day=present_time.wday
    if present_time.hour<16
      day-=1
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
    @thermostat = current_user.thermostats.where(serial_number: params[:serial_number]).last
   
    respond_to do |format|
      if @thermostat.configuration=="true"
        format.json {render json: {:status => 'OK',:temperature => @thermostat.temperature}}
      else
         present_time=Time.now
         day=get_day(present_time)
         time=get_time(present_time)
         format.json {render json: {:status => 'OK',:temperature => @thermostat.schedules.where(day: day).where(time: time).first.temperature}}
         
      end
    end
  end	

end