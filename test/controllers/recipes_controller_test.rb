require 'test_helper'

describe RecipesController do
  before do
    VCR.insert_cassette("recipe")
  end
  after do
    VCR.eject_cassette("recipe")
  end

  it "should get homepage" do
    get root_path
    must_respond_with :success

    get recipes_path
    must_respond_with :success
  end

  it "should get the search results page" do
    get recipes_path(search_term: "chocolate")
    must_respond_with :success
  end

  it "should get show recipe page" do
    get recipe_path( :label => "Silky, Decadent Old-School Chocolate Mousse", :recipe_id => "http://www.edamam.com/ontologies/edamam.owl%23recipe_638878ab810e8ecb8b3ac39f0b336157" )
    must_respond_with :success
  end
end
