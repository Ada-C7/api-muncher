class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:username], email: params[:email])
    if !user
      user = User.create(username: params[:username], email: params[:email])
    end
    session[:user_id] = user.id
    flash[:success] = "Logged in as #{user.username}"
    redirect_to :root        
  end

  def logout
    session[:user_id] = nil
    redirect_to :root
  end

end
