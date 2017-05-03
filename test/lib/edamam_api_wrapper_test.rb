require 'test_helper'

describe EdamamApiWrapper do

  describe "self.findRecipes(query)" do

    it "Can get a list of recipes" do
      #wrap api call in the use_cassette method
      VCR.use_cassette("edamam") do

        recipes = EdamamApiWrapper.findRecipes("chicken")

        recipes.must_be_instance_of Array
        recipes.class.must_equal Array
        recipes.each do |recipe|
          recipe.must_be_instance_of Recipe
        end
      end
    end

    it " Will return an empty arry if no recipe is found" do
      VCR.use_cassette("edamam") do
        skip
        recipes = EdamamApiWrapper.listRecipes("")

        recipes.must_equal []
      end
    end


  end
end
