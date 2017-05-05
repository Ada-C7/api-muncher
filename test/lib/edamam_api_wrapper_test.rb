require 'test_helper'

describe EdamamApiWrapper do

  describe "self.findRecipes(query)" do

    it " Can get a list of recipes" do

      VCR.use_cassette("Recipe") do

        recipes = EdamamApiWrapper.findRecipes("chicken")

        recipes.must_be_instance_of Array
        recipes.class.must_equal Array
        recipes.wont_be_nil
        recipes.length.must_be :>, 1

        recipes.each do |recipe|

          recipe.must_be_instance_of Recipe

          recipe.name.wont_be_nil
          recipe.name.must_be_instance_of String

          recipe.image.wont_be_nil
          recipe.image.must_be_instance_of String

          recipe.uri.wont_be_nil
          recipe.uri.must_be_instance_of String
        end
      end
    end

    it " Will return an empty arry if no recipe is found" do

      VCR.use_cassette("Recipe") do

        recipes = EdamamApiWrapper.findRecipes("")
        recipes.must_equal []
      end
    end


  end

  describe " Get a recipe " do

    it " Can get a recipe given a valid recipe uri" do

      VCR.use_cassette("Recipe") do

        recipes = EdamamApiWrapper.findRecipes("chicken")
        recipe = EdamamApiWrapper.showRecipe(recipes.first.uri)
        #could call the list recipe method and call the first recipe in that list to make this test lest dependent
        recipe.class.must_equal Recipe
        recipe.name.must_be_instance_of String
        recipe.name.wont_be_nil
        recipe.name.must_equal "Herbes de Provence Rotisserie Chickens"
        recipe.image.wont_be_nil
        recipe.options.wont_be_nil
        recipe.options[:calories].must_be_instance_of Float
        recipe.options[:servings].must_be_instance_of Float
        recipe.options[:diet].wont_be_nil
        recipe.options[:health].wont_be_nil
        recipe.options[:ingredients].length.must_be :>, 1
      end
    end

    it "should return nil for invalid uri" do
      #TODO: Not sure how to test this test case, as theres no way for a user to pass a bad uri.
      # QUESTION: how to handle JSON::ParserError: 409

      VCR.use_cassette("Recipe") do
        recipe = proc {EdamamApiWrapper.showRecipe("0000000")
        recipe}.must_raise JSON::ParserError
      end
    end
  end
end
