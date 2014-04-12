class UsersController < ApplicationController
	def profile
		if params[:id]
			@ofuser = User.find(params[:id])
		else
			@ofuser = current_user
		end
	end
end