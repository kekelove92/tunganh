class AdminController < ApplicationController

	before_action :authenticate_admin!

	def authenticate_admin!
		redirect_to root_path if @current_acount.role != 'admin'
		
	end


end