require "test_helper"

describe RecipesController do
  describe "index" do
    it "returns a page of recipes from a given search term" do
      VCR.use_cassette("recipes") do
        post recipes_path_url(search_term: "potato", from: 0, to: 10)
        must_respond_with :success
      end
    end

    it "still returns a page if there are no matching recipes" do
      VCR.use_cassette("bad_recipe") do
        post recipes_path_url(search_term: 12346, from: 0, to: 10)
        must_respond_with :success
      end
    end
  end

  describe "show" do
    it "can show a single recipe" do
      VCR.use_cassette("single_recipe") do
        get recipe_path_url(uri: "http://www.edamam.com/ontologies/edamam.owl#recipe_f1c853a77986214680bbdd424883499a")
        must_respond_with :success
      end
    end

    it "still returns a page if there's no uri" do
      VCR.use_cassette("single_recipe") do
        get recipe_path_url(uri: "http://stuffandrealthings.com")
        must_respond_with :success
      end
    end
  end
end
