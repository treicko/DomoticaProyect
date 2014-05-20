class ManagerController < ApplicationController
    load_and_authorize_resource :only => [:delete_user, :enable_user, :deshabilitar_usuario] 

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
		redirect_to '/manager/users_list'
	end

	def disable_user
		@user = User.find(params[:id])
		redirect_to '/manager/users_list'
	end

end
