class ThermostatHistory < ActiveRecord::Base
	belongs_to :thermostat
	validates_presence_of :thermostat,:temperature, :humidity, :consumption
	validates :temperature, numericality: { greater_than_or_equal_to: -20,less_than_or_equal_to: 60 }
	validates :humidity, numericality: { greater_than_or_equal_to: 0,less_than_or_equal_to: 100 }
	validates :consumption, numericality: { greater_than_or_equal_to: 0,less_than_or_equal_to: 1000 }
	validate :existence_of_thermostat, :correct_user
	def existence_of_thermostat
		if thermostat==nil
			errors.add(:thermostat, "doesn't exist")
		end
	end

	def correct_user
		if thermostat != nil
			if User.current != thermostat.location.user 
				errors.add(:thermostat, "is not yours")
			end
		end		
	end

	def check_temperature(thermostat_history)
		thermostat_id = thermostat_history.thermostat.id 
		temperature = thermostat_history.temperature
		hora_actual = Time.new
		alerts = Alert.where(:thermostat_id => thermostat_id)
		alerts.each do |alert|
			if (alert.temperature<=temperature)&&(alert.config_date.to_s==hora_actual.strftime("%Y-%m-%d"))

				if (hora_actual.strftime("%H:%M:%S")>=alert.config_time_initial.strftime("%H:%M:%S"))&&
				   (hora_actual.strftime("%H:%M:%S")<=alert.config_time_final.strftime("%H:%M:%S"))
					if(AlertHistory.count==0)||(AlertHistory.last.active==false)
						create_alert_history(thermostat_id, alert)
					else
						elapsed_time = get_elapsed_time(hora_actual)
						if elapsed_time.strftime("%H:%M:%S")>=Time.parse(alert.interval).strftime("%H:%M:%S")
							alertHistory = AlertHistory.last
							alertHistory.state = false
							alertHistory.active = false
							alertHistory.save
						end
					end
				end		
			    #UserMailer.registration_confirmation(@alertHistory.user_email).deliver    
			end
		end
		#UserMailer.registration_confirmation("").deliver
		#redirect_to '/locations'
	end

	def create_alert_history(thermostat_id, alert)
		alertHistory = AlertHistory.new
		alertHistory.thermostat_id = thermostat_id
		alertHistory.alert_id = alert.id
		#@alertHistory.user_id = current_user.id
		alertHistory.user_id = Location.find(Thermostat.find(thermostat_id).location_id).user_id
		# visto o no visto
		alertHistory.state = return_state_or_active(alert.interval)
		alertHistory.message = "La Temperatura Actual Sobrepaso La Temperatura Establecida"
		alertHistory.user_email = "treicko123@gmail.com"
		# activo o no activo
		alertHistory.active = return_state_or_active(alert.interval)
		alertHistory.save
	end

	def get_elapsed_time(hora_actual)
		segundos = (hora_actual-AlertHistory.last.created_at)
		minutos = (segundos/60).to_i #es el numero total de minutos
		horas = (minutos/60).to_i #numero total de horas
		#@dias = (@horas/24).to_i # numero total de dias
		string_hora = "#{horas}:#{set_time(minutos)}:#{set_time(segundos.to_i)}"
		return Time.parse(string_hora)
	end

	def return_state_or_active(interval)
		if(interval!="00:00:00")
			return true
		else
			return false
		end  
	end

	def set_time(time)
		while time>59 do
			time = time-60
		end
		return time
	end

end

	

class Status
  def initialize
    #@status_label = 'status'
    @status= 'OK'
    @message='Thermostat History saved correctly!'
  end
  
  attr_accessor :status, :message
end

