require 'test_helper'

describe "SearchApiWrapper" do

  describe "Testing self.listRecipes" do

    it "Can get a list of recipes" do
      VCR.use_cassette("recipe") do
        recipes = SearchApiWrapper.listRecipes("chicken" )
        # recipes.must_equal []
        recipes.must_be_instance_of Array
        recipes.each do |recipe|
          recipe.must_be_instance_of Recipe
        end
      end
    end

    it "Will return an empty array with invalid APP_ID and KEY_ID" do
      VCR.use_cassette("recipe") do

        recipes = SearchApiWrapper.listRecipes("chicken", "eee", "")
        recipes.must_equal []
       end
    end

    it "Will return empty array when there is no user search input " do

      VCR.use_cassette("recipe") do
        recipes = SearchApiWrapper.listRecipes("")

        recipes.must_equal []
      end

    end

    it "Will return empty array when user inter integr " do

      VCR.use_cassette("recipe") do
        recipes = SearchApiWrapper.listRecipes("")

        recipes.must_equal []
      end

    end





  end



  #
  #
end
