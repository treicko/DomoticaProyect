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
		@es_mayor = false;
		@thermostat_id = thermostat_history.thermostat.id 
		@temperature = thermostat_history.temperature
		@hora_actual = Time.new
		@alerts = Alert.where(:thermostat_id => @thermostat_id)
		@alertHistoryList = Array.new
		@alerts.each do |alert|
			if (alert.temperature<=@temperature)&&(alert.config_date.to_s==@hora_actual.strftime("%Y-%m-%d"))

				if (@hora_actual.strftime("%H:%M:%S")>=alert.config_time_initial.strftime("%H:%M:%S"))&&(@hora_actual.strftime("%H:%M:%S")<=alert.config_time_final.strftime("%H:%M:%S"))
					if(AlertHistory.count==0)||(AlertHistory.last.active==false)
						@alertHistory = AlertHistory.new
						@alertHistory.thermostat_id = @thermostat_id
						@alertHistory.alert_id = alert.id
						@alertHistory.user_id = current_user.id
						# visto o no visto
						@alertHistory.state = true
						@alertHistory.message = "La Temperatura Actual Sobrepaso La Temperatura Establecida"
						@alertHistory.user_email = "treicko123@gmail.com"
						# activo o no activo
						@alertHistory.active = true
						@alertHistory.save

						@alertHistoryList.push(@alertHistory)
					else

						@segundos = (@hora_actual-AlertHistory.last.created_at)
						@minutos = (@segundos/60).to_i #es el nÃºmero total de minutos
						@horas = (@minutos/60).to_i #nÃºmero total de horas
						@dias = (@horas/24).to_i # nÃºmero total de dÃ­as
						@resultado = "#{@horas%24} hora/s y #{@minutos%60} minutos"

						@string_hora = "#{@horas}:#{set_minutes(@minutos)}:#{set_seconds(@segundos.to_i)}"
						@hora_string_hora = Time.parse(@string_hora)
						if @hora_string_hora.strftime("%H:%M:%S")>=alert.interval.strftime("%H:%M:%S")
						   		
							@alertHistory = AlertHistory.last
							@alertHistory.state = false
							@alertHistory.active = false
							@alertHistory.save
							@alertHistoryList.push(@alertHistory)

						end
					end
				end		
				#	end
				#end
			    #UserMailer.registration_confirmation(@alertHistory.user_email).deliver    
			end
		end

		#UserMailer.registration_confirmation("").deliver
		#redirect_to '/locations'
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

