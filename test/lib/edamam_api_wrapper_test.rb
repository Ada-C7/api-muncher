require 'test_helper'

describe EdamamApiWrapper do

  before do
    VCR.insert_cassette("munch")
  end

  after do
    VCR.eject_cassette("munch")
  end

  describe "Testing self.searchRecipes" do

    it "can get a list of recipes" do
      # proc {
      #   EdamamApiWrapper.searchRecipes("apple").class
      # }.must_be_instance_of Proc

       response = EdamamApiWrapper.searchRecipes("apple")
       response.must_be_instance_of Array
       response.length.wont_equal 0

    end

    it "returns empty array with no search term" do
      # proc {
      #   EdamamApiWrapper.searchRecipes("apple", "abc")
      # }.must_be_instance_of Proc
      response = EdamamApiWrapper.searchRecipes("")
      response.length.must_equal 0
    end

  end

  describe "Testing self.getRecipe" do

    it "returns a recipe given a valid recipe id" do
      response = EdamamApiWrapper.getRecipe("6cf328cef60b30c179ac8b4df15c1ffd")

      response.must_be_instance_of Recipe

    end

    # it "returns nil for invalid recipe id" do
    #   response = EdamamApiWrapper.getRecipe("6cf328cef60b30c179ac8b4df15c1ffdxxx")
    #   response.length.must_equal 0
    #
    # end

  end
end
