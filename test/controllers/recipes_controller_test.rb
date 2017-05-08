require "test_helper"

describe RecipesController do
  before do
    VCR.insert_cassette("recipes")
  end
  after do
    VCR.eject_cassette("recipes")
  end

  it "should get search" do
    get root_path
    must_respond_with :success
  end

  it "should get index" do
    get list_recipes_path
    must_respond_with :success
  end

  it "should get show" do
    recipes = Recipe_Api_Wrapper.listRecipes("pie")
    get list_recipes_path({ :label => recipes[0].label, :uri => recipes[0].uri })
    must_respond_with :success
  end

end
