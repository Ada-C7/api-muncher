
class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']

    if auth_hash['uid']
      user = User.find_by(uid: auth_hash[:uid], provider: 'google')
      if user.nil?
        user = User.build_from_google(auth_hash)
        flash[:success] = "Created new user"
      else
        flash[:success] = "Logged in successfully"
      end
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Could not log in"
      redirect_to root_path
    end
  end

  def logout
    session[:user_id] = nil
    flash[:status] = :success
    flash[:result_text] = "Successfully logged out"
    redirect_to root_path
  end

end
