class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :check_account, :except => [:login, :logout]

  protected
  
  def current_account
    begin
      @current_account ||= Account.find session[:account_id]
    rescue ActiveRecord::RecordNotFound => e
      logger.error e
      return nil
    end
    @current_account
  end
  
  def check_account    
    unless current_account
      flash[:error] = "Debe loguearse primero"
      logger.warn "account is not connected, redirecting to AccountsController#login"
      session[:return_to] = request.fullpath
      redirect_to login_url and return
    end
  end 
  
  def permission_denied
    flash[:warn] = "No tiene permiso"
    redirect_to home_url
  end  

end
