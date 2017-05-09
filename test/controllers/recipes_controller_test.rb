require "test_helper"

describe RecipesController do

  before do
    VCR.insert_cassette("recipes")
  end

  after do
    VCR.eject_cassette("recipes")
  end


  describe "welcome" do
    it "succeeds" do
      get welcome_path
      must_respond_with :success
    end
  end

  describe "index" do
    it "succeeds when recipes are returned" do
      get recipes_path, params: {search: "blueberry", from: 4, to: 12}
      must_respond_with :success
    end

    it "succeds and gives an appropriate message when no recipes are found" do
      get recipes_path, params: {search: "XXXXXX", from:0, to:12}
      flash[:message].must_equal  "Sorry, we have no recipes for XXXXXX."
      must_respond_with :success
    end

    it "succeds and gives an appropriate message when an empty search was given" do
      get recipes_path, params: {search: "", from:0, to:12}
      flash[:message].must_equal  "Gimmie something to work with if you want some recipes."
      must_respond_with :success
    end
  end

  describe "show" do
    it "succeeds when a recipe is returned" do
      get recipe_path("c92c402e57d06df096adbffc393010c5")
      must_respond_with :success
    end

    it "succeds and gives an appropriate message when a recipe is not found" do
      get recipe_path("c92c402e57d06df096adbffc393010c5XXXXX")
      flash[:message].must_equal  "Sorry, we cannot find that recipe."
      must_respond_with :success
    end
  end
  
end
