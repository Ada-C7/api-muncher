class IngredientsController < ApplicationController

  def show
    @ingredients = EdmamApiWrapper.getRecipe
  end

end
