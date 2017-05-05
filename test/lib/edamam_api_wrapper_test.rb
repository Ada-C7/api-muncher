require 'test_helper'

describe EdamamApiWrapper do


  # THESE ARE NOT PASSING -- NOT SURE WHY
  describe "self.querySearch(search_terms, from, to)" do
    before do
      VCR.insert_cassette("recipes")
    end
    
    after do
      VCR.eject_cassette("recipes")
    end

    it "can get a list of recipes" do
      response = EdamamApiWrapper.querySearch("chicken", 0, 10)

      response.must_be_kind_of Array

    end

    it "will return empty array if no search term given" do
      response = EdamamApiWrapper.querySearch("", 0, 10)

      response.must_equal []

      # recipes.must_be_instance_of Array
    end

    it "returns 10 recipes at a time" do
      results = EdamamApiWrapper.querySearch("chicken", 0, 10)
      results.count.must_equal 10
    end

  end

  describe "testing self.getRecipe(recipe_uri)" do
    before do
      VCR.insert_cassette("recipe")
    end

    after do
      VCR.eject_cassette("recipe")
    end
    # WHAT SHOULD THIS TEST REALLY BE?
    it "can get a single recipe" do
      proc {
        EdamamApiWrapper.getRecipe("http://www.edamam.com/ontologies/edamam.owl#recipe_f1c853a77986214680bbdd424883499a")
      }.nil?.must_equal false
    end

    it "raise ArgError if getting a recipe fails" do
      proc {
        recipe_uri = "fake"
        recipe = EdamamApiWrapper.getRecipe(recipe_uri)
      }.must_raise ArgumentError
    end

  end


end
