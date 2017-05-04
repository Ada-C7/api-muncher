require 'test_helper'

describe "SearchApiWrapper" do

  describe "Testing self.listRecipes" do

    it "Can get a list of recipes" do
      VCR.use_cassette("recipe") do
        recipes = SearchApiWrapper.listRecipes()

        recipes.must_be_instance_of Array
        recipes.each do |recipe|
          recipe.must_be_instance_of Recipe
        end  
      end
    end
  end





end
