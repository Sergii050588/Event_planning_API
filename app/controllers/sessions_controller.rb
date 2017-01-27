class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    user.update_attributes(last_sign_in: DateTime.current)
    redirect_to events_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
