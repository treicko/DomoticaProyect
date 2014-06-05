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

		#@histories = Alert.all
		#@histories.each do |histo|
		#	histo.destroy
		#end

		@alerts = Alert.where(:thermostat_id => @thermostat_id)
		
		@alerts.each do |alert|
			if alert.temperature<=@temperature
				#@alertHistories = AlertHistory.where(:thermostat_id => alert.thermostat_id)
				#if(@alertHistories.count>0)
				#	if(@alertHistories.last.active)
				#		@time_new = Time.new
				#		@histories_create = @alertHistories.last.created_at
				#		@time_elapsed = (Time.new - @alertHistories.last.created_at).to_i
				#		@alert_interval = (alert.interval-60).to_i
				#		if @time_elapsed>@alert_interval
				#			@es_mayor = true;
				#		end
				#		@alert_id = alert.id
						#if verify_elapsed_time(@time_elapsed, alert.interval)
						#	@alertHistory = AlertHistory.new
						#	@alertHistory.thermostat_id = @thermostat_id
						#	@alertHistory.alert_id = alert.id
						#	@alertHistory.message = "Alerta: La Temperatura Actual Sobrepaso La Temperatura Establecida"
						#	@alertHistory.user_email = "treicko123@gmail.com"
						#	@alertHistory.save
						#end

				#	else
						
						@alertHistory = AlertHistory.new
						@alertHistory.thermostat_id = @thermostat_id
						@alertHistory.alert_id = alert.id
						@alertHistory.user_id = current_user.id
						@alertHistory.state = false
						@alertHistory.message = "La Temperatura Actual Sobrepaso La Temperatura Establecida"
						@alertHistory.user_email = "treicko123@gmail.com"
						@alertHistory.active = true
						@alertHistory.save
				#	end
				#end

			 	

			    UserMailer.registration_confirmation(@alertHistory.user_email).deliver    
			end
		end

		#@histories = AlertHistory.all
		#@histories.each do |histo|
		#	histo.destroy
		#end

		#UserMailer.registration_confirmation("").deliver
		#redirect_to '/locations'
	end

	def alert_history_list
		@user_id = params[:id]
		@alerts_user = AlertHistory.where(:user_id => @user_id, :state => 0)
		@alerts_user.each do |alert|
			alert.state = 1
			alert.save
		end
	end


end
