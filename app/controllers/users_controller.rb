class UsersController < ApplicationController
  before_action :require_correct_user, only: :show
  def show
   @user = User.find_by(id: params[:id])
   if @user.nil?
      redirect_to root_path
    end
 end
end
