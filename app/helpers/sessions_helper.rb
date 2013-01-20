module SessionsHelper

	def sign_in(user)
		cookies[:remember_token] = { value: user.remember_token,
									 expires: 3.days.from_now.utc }
		self.current_user = user #current_user yet to be written
	end

	def signed_in?
		!current_user.nil?
	end

	#---- setter and getter pair for current_user ----#
	def current_user=(user)
    	@current_user = user 
  	end

  def current_user 
    	@current_user ||= User.find_by_remember_token(cookies[:remember_token]) #because this relates to session, which persists its value for duration of SINGLE request only. The second part takes that out if  
  end
  	#--------------------------------------------------#


  def current_user?(user)
  		user == current_user
  end

  def sign_out
  		self.current_user = nil
  		cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
  		redirect_to(session[:return_to] || default)
  		session.delete(:return_to)
  end

  def store_location
  		session[:return_to] = request.url
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in." 
    end
  end



end
