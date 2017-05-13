class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :find_user

  private
  def find_user
    if session[:user_id]
      @login_user = User.find_by(id: session[:user_id])
    end
  end

  def require_correct_user
  if @login_user == nil || @login_user.id != User.find_by(id: params[:id]).id
    flash[:message] = "You cannot see this page"
    redirect_to root_path
  end
end
end
