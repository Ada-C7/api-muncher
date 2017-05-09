require "test_helper"

describe RecipesController do

  describe "search" do
    it "must get search page" do
      get root_path
      must_respond_with :success
    end
  end

  describe "index" do
    it "must get results page when there are results" do
      VCR.use_cassette("recipes") do
        get recipes_path(q: "chicken")
        must_respond_with :success
      end
    end

    it "must get results page when there are no results" do
      VCR.use_cassette("recipes") do
        get recipes_path(q: "")
        must_respond_with :success
      end
    end
  end

  describe "show" do
    it "shows a page for a recipe that exists" do
      VCR.use_cassette("recipes") do
        recipe_uri = "http://www.edamam.com/ontologies/edamam.owl%23recipe_f1c853a77986214680bbdd424883499a"
        get recipe_path(uri: recipe_uri)

        must_respond_with :success
      end
    end

    it "renders 404 if the recipe is not found" do
      VCR.use_cassette("recipes") do
        fake_uri = "http://www.edamam.com/ontologies/edamam.owl%23recipe_fake-uri"
        get recipe_path(uri: fake_uri)

        must_respond_with :missing
      end
    end
  end
end
