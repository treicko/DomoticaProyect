class ManagerController < ApplicationController

	def users_list
		@users = User.all
	end

end
