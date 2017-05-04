require 'test_helper'

describe EdamamApiWrapper do
  before do
    VCR.insert_cassette("edamam")
  end

  after do
    VCR.eject_cassette("edamam")
  end

  describe "self.querySearch(search_terms, from, to)" do

    it "can get a list of recipes" do
      recipes = EdamamApiWrapper.querySearch("chicken", 0, 10)
      recipes.must_be_kind_of Array
      # recipes.each do |recipe|
      #   recipe.must_be_instance_of RecipeResult
      # end
    end

    it "will return false with no search term given" do
      recipes = EdamamApiWrapper.querySearch("", 0, 10)

      recipes.must_equal nil

      # recipes.must_be_instance_of Array
    end

    it "returns 10 recipes at a time" do
      recipes = EdamamApiWrapper.querySearch("chicken", 0, 10)
      count = 0
      recipes.each do
        count += 1
      end
      count.must_equal 10
    end


  end

  describe "testing self.getRecipe(recipe_uri)" do
    it "can get a single recipe" do
      recipe_uri = "http://www.edamam.com/ontologies/edamam.owl%23recipe_f1c853a77986214680bbdd424883499a"
      recipe = EdamamApiWrapper.getRecipe(recipe_uri)

      recipe.must_be_instance_of RecipeResult
    end

    it "returns false getting a recipe fails" do
      recipe_uri = "fake"
      recipe = EdamamApiWrapper.getRecipe(recipe_uri)
      # ?????? not sure what this actually returns
      recipe.name.must_equal nil
    end

  end


end
