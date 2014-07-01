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

	def alert_history_list
		@user_id = params[:id]
		@alerts_user = AlertHistory.where(:user_id => @user_id, :state => false)
		@alerts_user.each do |alert|
			alert.state = 1
			alert.save
		end
	end


end
