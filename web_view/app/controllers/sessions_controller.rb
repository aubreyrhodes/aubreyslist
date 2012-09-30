class SessionsController < ApplicationController
  skip_before_filter :authenticate!

  def new
  end

  def create
    if !request.env['omniauth.auth']
      render :nothing => true, :status => :bad_request
    else
      response = request.env['omniauth.auth']
      info = response['user_info'] || response['info']
      session[:email] = info['email']
      redirect_to root_path
    end
  end
end
