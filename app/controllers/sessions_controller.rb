class SessionsController < ApplicationController

	skip_before_action :authenticate_account!, only: [:new, :create]
	def new
		if session[:current_account_id]
		   return	redirect_to root_path
			
		end

	end

	def create
		#if we can authenticate user
		#redirect root_path
		authorized_account = Account.authenticate(
								params[:email], 
								params[:password])
		if authorized_account

			session[:current_account_id] = authorized_account.id
			redirect_to root_path #khi login thi quay lai root o routes

		else
			render :new
		end

	end

	def destroy
		session[:current_account_id] = nil
		redirect_to accounts_login_path
	end



end