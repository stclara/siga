# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  before_filter :authenticate, :default_before_filter

  skip_before_filter :authenticate_adm, :only => [:access_denied]

  helper_method :session_user

  protected
  def session_user
    @session_user ||= User.find(:first, :conditions => ['id = ?', session[:user]])
  end

  protected
    def authenticate
      unless session[:user]
        session[:return_to] = request.request_uri
        redirect_to :controller => "login", :action => "login"
        return false
      end
      return true
    end

  def access_adm
    unless session_user && session_user.adm == 'SIM'
      flash[:warning] = "<b>Desculpe, você não possui permissão para acessar esta página!</b>"
      redirect_to :controller => "home", :action => "index"
      return false
    end
    return true
  end

   def access_opr
    unless session_user && session_user.opr == 'SIM'
      flash[:warning] = "<b>Desculpe, você não possui permissão para acessar esta página!</b>"
      redirect_to :controller => "home", :action => "index"
      return false
    end
    return true
  end

  def access_ger
    unless session_user && session_user.ger == 'SIM'
      flash[:warning] = "<b>Desculpe, você não possui permissão para acessar esta página!</b>"
      redirect_to :controller => "home", :action => "index"
      return false
    end
    return true
  end

  def default_before_filter
    headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    headers["Expires"] = "Thu, 01 Jan 1970 00:00:00 GMT"
    return true
  end 

end
