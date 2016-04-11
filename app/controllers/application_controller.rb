class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !!current_user
  end

  def require_sign_in
    return if signed_in?
    flash[:info] = "You must be logged in to access that page."
    redirect_to sign_in_path
  end

  helper_method :signed_in?, :current_user
end
