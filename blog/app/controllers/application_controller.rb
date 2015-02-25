class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   protected
    
    def login_required
      return true if User.find_by_id(session[:user_id])
      access_denied
      return false
    end
    def access_denied
      flash[:error] = 'Oops. You need to login before you can view that page.'
      redirect_to :log_in
    end
  protect_from_forgery with: :exception
end
