require "test_helper"

describe RecipesController do
  describe "index" do
      it "is successful for a valid search with many recipes" do
        VCR.use_cassette("responses") do
          @recipe_array = EdamamRecipes.get_recipes("pie", 0, 9)
          get recipes_path
          must_respond_with :success

          # if @recipe_array.length == 0
          #   flash[:status] = :failure
          #   flash[:result_text] = "Sorry, no results were found for your search.  Would you like to search for something else?"
          #   redirect_to root_path
          # @recipes_array.length.must_be :>, 0
        end
      end

      it "is reloads root and says it's a failed search when there are zero recipes" do
        VCR.use_cassette("responses") do
          @recipe_array = EdamamRecipes.get_recipes("jhjg", 0, 9)
          get recipes_path
          must_respond_with :success
          # EdamamRecipes.destroy_all
          get root_path
        end
      end
  end
end
