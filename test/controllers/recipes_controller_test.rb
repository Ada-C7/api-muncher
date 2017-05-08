require "test_helper"

describe RecipesController do
  before do
    VCR.insert_cassette("recipes-controller")
  end
  after do
    VCR.eject_cassette("recipes-controller")
  end
  
  it "should get index" do
    get recipes_index_url
    value(response).must_be :success?
  end

  it "should get show" do
    get recipes_show_url
    value(response).must_be :success?
  end

end
