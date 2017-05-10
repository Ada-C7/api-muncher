require "test_helper"

describe EdamamApiWrapper do

  it "It returns a list of recipes in an array" do
    VCR.use_cassette("recipes") do
      search = "chicken"
      response = EdamamApiWrapper.findRecipes(search)
      response.class.must_equal Array
    end
  end

  it "returns an array of Recipe objects" do
    VCR.use_cassette("recipes") do
      search = "chicken"
      response = EdamamApiWrapper.findRecipes(search)
      response[0].class.must_equal Recipe
    end
  end

  it "Does not return a list without a search parameter" do
    proc {
    VCR.use_cassette("recipes") do
      response = EdamamApiWrapper.findRecipes()
    end
    }.must_raise ArgumentError
  end

  it "returns a list of nine items" do
    VCR.use_cassette("recipes") do
      search = "chicken"
      response = EdamamApiWrapper.findRecipes(search)
      response.length.must_equal 9
    end
  end

  it "returns a list starting from a certain point" do
    VCR.use_cassette("recipes") do
      search = "chicken"
      response1 = EdamamApiWrapper.findRecipes(search)
      response2 = EdamamApiWrapper.findRecipes(search, 10, 19)
      response1[0].label.wont_equal response2[0].label
    end
  end

  it "returns a single recipe" do
    VCR.use_cassette("recipe") do
      search = "chicken"
      response1 = EdamamApiWrapper.findRecipes(search)[0]

      response2 = EdamamApiWrapper.findRecipe(response1.uri)
      response2.class.must_equal Recipe
    end
  end
end
