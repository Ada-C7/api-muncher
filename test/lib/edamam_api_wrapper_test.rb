require "test_helper"

describe EdamamApiWrapper do

  it "It gets a list of recipes in an array" do
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

  it "Does not get a list without a search parameter" do
    proc {
    VCR.use_cassette("recipes") do
      response = EdamamApiWrapper.findRecipes()
    end
    }.must_raise ArgumentError
  end
end
