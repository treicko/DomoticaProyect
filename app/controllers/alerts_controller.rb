class AlertsController < ApplicationController
protect_from_forgery except: :index
	def lala
		@mens = Hash.new
		@mens['email'] = params[:email]
		@mens['password'] = params[:password]
		@mens['coments'] = params[:coment]

		#@mens = params[:q]
	end

	def setting_alert
	end

end
