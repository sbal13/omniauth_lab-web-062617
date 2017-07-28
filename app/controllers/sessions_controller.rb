class SessionsController < ApplicationController

  def create
    reset_session
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end
    @auth = auth
 
    session[:user_id] = @user.id
 
  end

  def destroy
    session.clear
    render 'welcome/home'
  end
 
  private
 
  def auth
    request.env['omniauth.auth']
  end
end