require 'test_helper'

describe RecipesController do

  before do
    VCR.insert_cassette("recipe")
  end
  after do
    VCR.eject_cassette("recipe")
  end

  it "should get search page" do
    skip
    get root_path
    must_respond_with :success
  end

  it "should get the search results page" do
    skip
    get recipes_path("chocolate")
    must_respond_with :success
  end

  # it "should get the search results page even if search is blank" do
  #   get recipes_path(" ")
  #   must_respond_with :success
  # end

  it "should get show recipe page" do
    skip
    get recipe_path("id")
    must_respond_with :success
  end
end
