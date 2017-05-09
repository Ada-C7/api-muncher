class UsersController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    if user.save
      session[:user_id] = user.id
      flash[:message] = "Successfully logged in as new user #{user.name}!"
    else
      flash.now[:message] = "Could not log in"
      user.errors.messages.each do |field, problem|
        flash[:field] = problem.join(', ')
      end
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
