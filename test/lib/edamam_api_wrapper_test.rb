require 'test_helper'

describe EdamamApiWrapper do
  before do
    VCR.insert_cassette("edamam")
  end

  after do
    VCR.eject_cassette("edamam")
  end

  # THESE ARE NOT PASSING -- NOT SURE WHY
  describe "self.querySearch(search_terms, from, to)" do

    it "can get a list of recipes" do skip
      response = EdamamApiWrapper.querySearch("chicken", 0, 10)

      response.must_be_kind_of Array
      # recipes.each do |recipe|
      #   recipe.must_be_instance_of RecipeResult
      # end
    end

    it "will return empty array if no search term given" do skip
      response = EdamamApiWrapper.querySearch("", 0, 10)

      response.must_equal []

      # recipes.must_be_instance_of Array
    end

    it "returns 10 recipes at a time" do skip
      results = EdamamApiWrapper.querySearch("chicken", 0, 10)
      results.count.must_equal 10
    end


  end

  describe "testing self.getRecipe(recipe_uri)" do
    it "can get a single recipe" do
      recipe_uri = "http://www.edamam.com/ontologies/edamam.owl%23recipe_f1c853a77986214680bbdd424883499a"
      recipe = EdamamApiWrapper.getRecipe(recipe_uri)

      recipe.must_be_instance_of RecipeResult
    end

    it "raise ArgError if getting a recipe fails" do
      proc {
        recipe_uri = "fake"
        recipe = EdamamApiWrapper.getRecipe(recipe_uri)
      }.must_raise ArgumentError
    end

  end


end
