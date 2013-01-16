class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password]) #built in rails method for checking passwords
			sign_in user #put in user's remember_token into the cookie
			redirect_back_or user #once user is signed in, put them back where they initially wanted to go if they were redirected to this page
		else
			flash.now[:error] = "Invalid email/password combination."
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end


end
