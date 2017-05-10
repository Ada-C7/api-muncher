class UsersController < ApplicationController

  def account
    @user = User.find_by_id(current_user.id)
    @recipes = Recipe.where(user_id: current_user.id)
    @searches = Search.where(user_id: current_user.id)
  end

end
