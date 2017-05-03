class RecipesController < ApplicationController

  def search
  end

  def index
    @search_term = params[:q]
  end

  def show
  end

end
