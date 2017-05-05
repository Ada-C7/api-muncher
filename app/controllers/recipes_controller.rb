class RecipesController < ApplicationController

  ### don't think I need this
  # def new
  #   @recipe = Recipe.new
  # end

  def create
    @recipe = Recipe.new(name: session[:recipe_name], recipe_url: session[:recipe_url], user_id: current_user.id)
    if @recipe.save
      flash[:success] = "Added #{@recipe.name} to your favorites list"
      redirect_to account_path
    else
      flash.new[:failure] = "Unable to add to favorites right now. Sorry!"
    end

  end

  def destroy
    Recipe.find(params[:id]).destroy
    redirect_to account_path
  end

end
