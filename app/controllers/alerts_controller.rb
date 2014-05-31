class AlertsController < ApplicationController
protect_from_forgery except: :index

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
		@thermostat_id = params[:thermostat_id]
		@temperature = params[:temperatura]
		@alerts = Alert.where(:thermostat_id => @thermostat_id)
		@alerts.each do |alert|
			# if alert.temperature==@temperature
			# redirect_to '/thermostat_histories'
			#	@alertHistory = AlertHistory.new
			#	@alertHistory.thermostat_id = @thermostat_id
			#	@alertHistory.alert_id = alert.id
			#	@alertHistory.message = "Alerta: La Temperatura Actual Sobrepaso La Temperatura Establecida"
			#	@alertHistory.user_email = "treicko123@gmail.com"
			#	@alertHistory.save

			#    UserMailer.registration_confirmation(@alertHistory.user_email).deliver    
			#end
		end
		UserMailer.registration_confirmation("").deliver
		redirect_to '/locations'
	end

end
