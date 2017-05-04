require 'test_helper'

describe RecipesController do
  # before do
  #   recipe_hash = {
  #     "id" => "http://www.edamam.com/ontologies/edamam.owl%23recipe_638878ab810e8ecb8b3ac39f0b336157",
  #     "label" => "Silky, Decadent Old-School Chocolate Mousse",
  #     "image" => "mousse.com/mousse.jpg",
  #     "url" => "mousse.com/mousse",
  #     "ingredientLines" => ["yummyness", "chocolate bits", "savoury sweet flavor"],
  #     "dietLabels" => ["so healthy", "really we promise"],
  #     "healthLabels" => ["happiness", "delight", "full tummy"]
  #   }
  #
  #     @recipe = Recipe.new(recipe_hash)
  # end

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
    # get recipes_path
    # must_respond_with :success
  end

  it "should get show recipe page" do
    skip
    get recipe_path(:label => "http://www.edamam.com/ontologies/edamam.owl%23recipe_638878ab810e8ecb8b3ac39f0b336157", :recipe_id => "Silky, Decadent Old-School Chocolate Mousse")
    must_respond_with :success
  end
end
