class IngredientsController < ApplicationController

  def show
    @ingredient = EdmamApiWrapper.getRecipe
  end

end
