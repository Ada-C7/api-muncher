
class SessionsController < ApplicationController
  # 
  # def create
  #   auth_hash = request.env['omniauth.auth']
  #   user = User.find_by(uid: auth_hash[:"uid"], provider: params[:provider] )
  #   if user.nil?
  #     user = User.build_from_google(auth_hash)
  #     if user.save
  #       session[:user_id] = user.id
  #       flash[:message] = "Successfully logged in as NEW user"
  #     else
  #       flash[:message] = "Could not log in as new user"
  #       user.errors.messages.each do |field, problem|
  #         flash[:field] = problem.join(", ")
  #       end
  #     end
  #   else # if we found a user in our database
  #     session[:user_id] = user.id
  #     flash[:success] = "Welcome back, #{user.name}"
  #   end
  #   redirect_to root_path
  #
  # end


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

  #  def index
  #    @user = User.find(session[:user_id]) # < recalls the value set in a previous request
  #  end


end
