require "test_helper"

describe RecipesController do
  describe "search" do
    it "should get search" do
      VCR.use_cassette("recipes") do
        get search_path
        must_respond_with :success
      end
    end
  end

  describe "list" do
    it "should get list" do
      VCR.use_cassette("recipes") do
        get list_path(search_term: "pasta", from: 0, to: 10, health: nil)
        must_respond_with :success
      end
    end
  end

  describe "recipe" do
    it "should get a recipe" do
      VCR.use_cassette("recipes") do
        get recipe_path(uri: "recipe_1e43fbf22e7a7254d65d0ca58d0618b2")
          must_respond_with :success
      end
    end
  end
end
