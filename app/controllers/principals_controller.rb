class PrincipalsController < ApplicationController

	def index
		if user_signed_in?
			if current_user.user_enable==false
				#redirect_to destroy_user_session_path
				#redirect_to '/users/sign_out'
				#redirect_to 'devise/sessions#destroy'
				#redirect_to destroy_user_session_path, :method => :delete
				sign_out 
			end
		end

	end
	
end
