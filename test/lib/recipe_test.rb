require 'test_helper'

describe Recipe do

  describe "initialize" do

    it "Takes a hash, and assigns name, image, id, original_url" do

      recipe_params = {name: "food", image:"picture of food", id: 2345, original_url: "url"}
      recipe = Recipe.new(recipe_params)
      recipe.name.must_equal recipe_params[:name]
    end

    it "Requires a hash" do
      proc {
        Recipe.new
      }.must_raise ArgumentError
    end
  end

end
