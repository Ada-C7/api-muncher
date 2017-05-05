class UsersController < ApplicationController
  # def create
  #   user = User.from_omniauth(env["omniauth.auth"])
  #   session[:user_id] = user.id
  #   redirect_to root_path
  # end
  def create
    auth_hash = request.env['omniauth.auth']
    user = User.find_by(provider: params[:provider], uid: auth_hash["uid"])
    if user.nil?
      user = User.from_omniauth(auth_hash)
      if user.save
        session[:user_id] = user.id
        flash[:message] = "Successfully logged in as new user #{user.name}!"
      else
        flash.now[:message] = "Could not log in"
        user.errors.messages.each do |field, problem|
          flash[:field] = problem.join(', ')
        end
      end
    else
      session[:user_id] = user.id
      flash[:message] = "Successfully logged in as existing user #{user.name}"
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
