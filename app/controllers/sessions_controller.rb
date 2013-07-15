class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			if sign_in user 
				redirect_back_or user
			else
				redirect_to root_url, :alert => "Your account has not yet been approved."
			end
			
		else
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy 
		sign_out
		redirect_to root_path
	end
end
