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

  describe " Get a recipe " do

    it " Can get a recipe given a valid recipe uri" do
      VCR.use_cassette("edamam") do
        skip
        recipe = EdamamApiWrapper.getRecipe("")
        #could call the list recipe method and call the first recipe in that list to make this test lest dependent
        recipe.class.must_equal Recipe
        recipe.name.must_be_instance_of String
        recipe.name.must_equal ""
      end
    end

    it "should return false given an invalid recipe id" do
      VCR.use_cassette("edamam") do
        skip
        recipe = EdamamApiWrapper.getRecipe("0000000")
        recipe.must_be_nil
      end
    end
  end
end
