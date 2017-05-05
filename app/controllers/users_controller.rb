class UsersController < ApplicationController

  def account
    @recipes = Recipe.where(user_id: current_user.id)
    @searches = Search.where(user_id: current_user.id)
    @user = User.find_by_id(current_user.id)
  end
  
end
