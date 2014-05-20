class ManagerController < ApplicationController
    #load_and_authorize_resource :only => [:users_list, :enable_user, :deshabilitar_usuario] 
	before_action :authenticate_user!

	def users_list
		@users = User.all
	end

	def show_user
		@user = User.find(params[:id])
	end

	def delete_user
		user = User.find(params[:id])
		user.destroy
		redirect_to '/manager/users_list'
	end

	def enable_user
		@user = User.find(params[:id])
		@user.user_enable=true
		@user.save
		redirect_to '/manager/users_list'
	end

	def disable_user
		@user = User.find(params[:id])
		@user.user_enable=false
		@user.save
		redirect_to '/manager/users_list'
	end

	def change_role
		@user = User.find(params[:id])
		if(@user.rol=="Administrador")
			then
			@user.rol = "Usuario"
		else
			#if @user.rol? then
				@user.rol = "Administrador"
			#else
				#@user.rol ="Administrador"
				#@user.add_role "admin"
				#Ability.new(@user)
			#end
		end
		@user.save
		
		redirect_to '/manager/users_list'
	end

end
