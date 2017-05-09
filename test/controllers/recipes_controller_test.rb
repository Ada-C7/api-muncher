require "test_helper"

describe RecipesController do
  describe "index" do
    it "should get list of recipes" do
      VCR.use_cassette("edamam") do
        get search_recipe_path

        must_respond_with :success
      end
    end
    # it "must be a real test" do
  end

  describe "show" do
    it "should show details for one recipe" do
      VCR.use_cassette("edamam") do
        recipes = EdamamApiWrapper.search("potato")
        get recipe_path({:label => recipes[0].label, :uri => recipes[0].uri})

        must_respond_with :success
      end
    end
  end
  #   flunk "Need real tests"
  # end
end
