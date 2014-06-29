class AlertsController < ApplicationController
protect_from_forgery except: :index

	def alert_edit
		@alert = Alert.find(params[:id])
	end

	def destroy
		@alert = Alert.find(params[:id])
		@alert.destroy
		redirect_to '/locations'
	end

	def alert_list
		@alerts = Alert.where(:thermostat_id => params[:id])
	end

	def alert_setting_list
		@alerts = Alert.where(:thermostat_id => Alert.last.thermostat_id)
	end

	def setting_alert
		@thermostat_id = params[:id]
	end

	def save_setting_alert
		@alert = Alert.new 
		@alert.config_date = params[:fecha]
		@alert.temperature = params[:temperatura]
		@alert.interval = params[:intervalo]
		@alert.thermostat_id = params[:thermostat_id]
		@alert.config_time_initial = params[:hora_inicial]
		@alert.config_time_final = params[:hora_final]
		@alert.save
		redirect_to '/alerts/alert_setting_list'
	end

	def send_temperture
		@thermostat_id = params[:id]
	end

	def check_temperature 
		@es_mayor = false;
		@thermostat_id = params[:thermostat_id]
		@temperature = params[:temperatura].to_i
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

	def set_minutes(minutos)
		while minutos>59 do
			minutos = minutos-60
		end
		return minutos
	end

	def set_seconds(segundos)
		while segundos>59 do
			segundos = segundos-60
		end
		return segundos
	end

	def alert_history_list
		@user_id = params[:id]
		@alerts_user = AlertHistory.where(:user_id => @user_id, :state => false)
		@alerts_user.each do |alert|
			alert.state = 1
			alert.save
		end
	end


end
