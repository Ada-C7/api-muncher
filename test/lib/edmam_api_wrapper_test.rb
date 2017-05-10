require 'test_helper'

describe EdmamApiWrapper do

  describe "List Recipes" do

    it "Can get a recipe reponse" do
      VCR.use_cassette("edmam") do

        recipe_response = EdmamApiWrapper.listRecipes("beans", 1, 11)

        recipe_response.must_be_instance_of RecipeResponse

        recipe_response.recipe.each do | rec |
          rec.must_be_instance_of Recipe
        end

        recipe_response.recipe_count.must_be_instance_of Integer
      end
    end
  end

  describe "Get Recipe" do

    it "Can get a recipe given a valid recipe uri" do
      VCR.use_cassette("edmam") do

        recipe = EdmamApiWrapper.getRecipe("http://www.edamam.com/ontologies/edamam.owl#recipe_41a36a2437f0a95f19657d022be728ec")

        recipe.must_be_instance_of Recipe
      end
    end

    it "Returns error for an invalid uri" do
      VCR.use_cassette("edmam") do

        assert_raises(JSON::ParserError) {
          EdmamApiWrapper.getRecipe("?????????")
        }
      end
    end
  end
end
