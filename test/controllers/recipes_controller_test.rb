require "test_helper"

describe RecipesController do

  describe "index" do
    it "gets recipes path" do
      VCR.use_cassette("recipes") do
        @from = 0
        get recipes_path("chicken", @from)
        must_respond_with :success
      end
    end
  end
  describe "search" do
    it "gets root path" do
      VCR.use_cassette("recipes") do
        get recipe_search_path
        must_respond_with :success
      end
    end
  end
  describe "show" do
    it "gets recipe path " do
      VCR.use_cassette("recipes") do
        get recipe_path("recipe_f1c853a77986214680bbdd424883499a")
        must_respond_with :success
      end
    end
  end
end
