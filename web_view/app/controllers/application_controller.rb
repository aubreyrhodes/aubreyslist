class ApplicationController < ActionController::Base
  attr_reader :current_email

  helper_method :current_email

  protect_from_forgery
  before_filter :authenticate!

  def authenticate!
    if session[:email].present?
      @current_email = session[:email]
    else
      redirect_to new_session_path
      false
    end
  end
end
