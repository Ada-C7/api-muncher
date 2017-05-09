class SessionsController < ApplicationController

  def create
      user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:status] = :success
    flash[:result_text] = "Successfully logged out"
    session[:search_terms] = []
    redirect_to root_path
  end
end
