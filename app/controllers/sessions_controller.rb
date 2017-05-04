class SessionsController < ApplicationController

  def login; end

  def create
    user = User.find_by(provider: params[:provider], uid: params[:uid])
    if !user
      user = User.create(provider: params[:provider], uid: params[:uid])
      if user.id != nil
        session[:user_id] = user.id
        flash[:success] = "Logged in as #{user.username}"
        redirect_to :root
      else
        flash.now[:failure] = "Sorry, unable to log in"
        render :login
      end
    else
      session[:user_id] = user.id
      flash[:success] = "Logged in as #{user.username}"
      redirect_to :root
    end

  end

  def logout
    session[:user_id] = nil
    redirect_to :root
  end

end
