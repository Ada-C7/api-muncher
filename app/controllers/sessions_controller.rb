class SessionsController < ApplicationController

  def login; end

  def create
    user = User.find_by(provider: params[:provider], uid: params[:uid])
    if user
      session[:user_id] = user.id
      flash[:success] = "Logged in as #{user.username}"
      redirect_to :root
    else
      user = User.new(provider: params[:provider], uid: params[:uid])
      if user.save
        session[:user_id] = user.id
        flash[:success] = "Successfully logged in"
        redirect_to :root
      else
        flash.now[:failure] = "Sorry, unable to log in"
        render :login
      end
    end

  end

  def logout
    session[:user_id] = nil
    flash[:success] = "Come back soon!"
    redirect_to :root
  end

end
