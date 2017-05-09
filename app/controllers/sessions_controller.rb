class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    user = User.find_by(provider: params[:provider],
                      uid: auth_hash["uid"])

    if user.nil?
      #Don't know this user - build a new one
      user = User.from_omniauth(auth_hash)
      if user.save
        session[:user_id] = user.id
        flash[:message] = "Successfully logged in as user #{user.name}"
      else
        flash[:message] = "Could not log in"
        user.errors.messages.each do |field, problem|
          flash[:field] = problem.join(', ')
        end
      end
    else
      session[:user_id] = user.id
      flash[:message] = "Successfully logged in as user #{user.name}"
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:status] = :success
    flash[:result_text] = "Successfully logged out"
    redirect_to root_path
  end
end
