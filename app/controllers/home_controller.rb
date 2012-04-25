require 'bcrypt'

class HomeController < ApplicationController
  
  def index
  end

  def login
  	if (params[:email])
      user = authenticate(params[:email], params[:password])
      if user
        session[:user] = user.id
        redirect_to root_url, :notice => "Login successful"
        return
      else
        redirect_to login_url, :notice => "Login unsuccessful"
	    return
	  end
	end
    respond_to do |format|
      format.html
    end
  end

  def logout
    session.delete(:user)
    redirect_to root_url
  end

  def authenticate(email, password)
  	user = User.find(:all, :conditions => ['email = ?',  email])[0]
  	if not user:
  	  return nil
  	end
	newp = BCrypt::Password.new(user.password_hash)
  	if (newp == password)
      return user
  	end
  	return nil
  end
end

