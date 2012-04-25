class ApplicationController < ActionController::Base
  protect_from_forgery

  def login_required
    user = session[:user] ? User.find(session[:user]) : nil
    if not user
      flash[:message]  = "Login required"
      redirect_to root_url
    end
  end

  def teacher_required
    user = session[:user] ? User.find(session[:user]) : nil
    if not user
      redirect_to root_url, :notice => "Login required"
      return
    end
    if not user.teacher and not user.admin
      redirect_to root_url, :notice => "Teacher required"
      return
    end
  end

  def admin_required
    user = session[:user] ? User.find(session[:user]) : nil
    if not user
      redirect_to root_url, :notice => "Login required"
      return
    end
    if not user.admin
      redirect_to root_url, :notice => "Admin required"
      return
    end
  end

end
