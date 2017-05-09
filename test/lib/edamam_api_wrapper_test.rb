require 'test_helper'

describe EdamamApiWrapper do
  before do
    VCR.insert_cassette("edamam")
  end

  after do
    VCR.eject_cassette("edamam")
  end

  describe "#listRecipes method" do
    it "can get a list of channels" do
      recipes = EdamamApiWrapper.listRecipes("taiwanese")

      recipes.must_be_instance_of Array
      recipes.each do |recipe|
        recipe.must_be_instance_of Recipe
      end
    end

    it "will return empty array with a bad query" do
      recipes = EdamamApiWrapper.listRecipes("jkhg76987")

      recipes.must_equal []
    end

    it "will return empty array with no query" do
      recipes = EdamamApiWrapper.listRecipes("")

      recipes.must_equal []
    end
  end

  describe "#getRecipe method" do
    it "can get a recipe given a valid uri" do
      recipe = EdamamApiWrapper.getRecipe("https://www.edamam.com/ontologies/edamam.owl%23recipe_9f599ab29949e1a7989a06c227f8ba70")

      recipe.must_be_instance_of Recipe
      recipe.uri.wont_be_nil
    end

    it "returns false for an invalid recipe uri" do
      recipe = EdamamApiWrapper.getRecipe("https://www.nope.com")
      recipe.wont_be_instance_of Recipe
      recipe.must_be_nil
    end

    it "returns something for invalid input" do
      recipe = EdamamApiWrapper.getRecipe("ksldkafj")
      recipe.wont_be_instance_of Recipe
      recipe.must_be_nil
    end
  end

end
