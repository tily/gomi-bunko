class SessionsController < ApplicationController
  def callback
    auth = request.env["omniauth.auth"]
    session[:twitter] = auth['info']['nickname']
    redirect_to '/'
  end

  def destroy
    session[:twitter] = nil
    redirect_to '/'
  end
end
