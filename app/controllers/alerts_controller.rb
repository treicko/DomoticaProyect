class AlertsController < ApplicationController
protect_from_forgery except: :index
	def lala
		@mens = Hash.new
		@mens['email'] = params[:email]
		@mens['password'] = params[:password]
		@mens['coments'] = params[:coment]

		#@mens = params[:q]
	end

	def alert_setting_list
		@alerts = Alert.where(:thermostat_id => Alert.last.thermostat_id)
	end

	def setting_alert
		@thermostat_id = params[:id]
	end

	def save_setting_alert
		@alert = Alert.new()
		@alert.config_date = params[:fecha]
		@alert.temperature = params[:temperatura]
		@alert.interval = params[:intervalo]
		@alert.thermostat_id = params[:thermostat_id]
		@alert.config_time_initial = params[:hora_inicial]
		@alert.config_time_final = params[:hora_final]
		@alert.save
		redirect_to '/alerts/alert_setting_list'
	end

end
