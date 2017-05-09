require "test_helper"

describe RecipesController do
  describe "index" do
      it "is successful for a valid search with many recipes" do
        VCR.use_cassette("responses") do
          @recipe_array = EdamamRecipes.get_recipes("pie", 0, 9)
          get recipes_path
          must_respond_with :success
        end
      end

      it "is reloads root and says it's a failed search when there are zero recipes" do
        VCR.use_cassette("responses") do
          @recipe_array = EdamamRecipes.get_recipes("jhjg", 0, 9)
          #  assert_equal flash[:status] = :failure
          # assert_equal flash[:result_text], "Sorry, no results were found for your search. \n Would you like to search for something else?"
          get root_path
          must_respond_with :success
        end
      end
  end

  describe "show" do
    it "succeeds for a recipe with a valid url" do
      VCR.use_cassette("responses") do
      get recipe_path("recipe_2badacc382e7e9959d70e3611a7eb06f")
      must_respond_with :success
    end
    end

    it "renders 404 not_found for an invalid recipe" do
      VCR.use_cassette("responses") do
        # ng_uri = @recipe_array.last.uri +
        get recipe_path("it'safakjhkghjhddssddffke")
        must_respond_with :not_found
    end
    end
  end
end
