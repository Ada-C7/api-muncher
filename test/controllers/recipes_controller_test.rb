require "test_helper"

describe RecipesController do
  it "should get index" do
    get root_path
    must_respond_with :success
  end

  it "should get a list of recipes" do
    get recipes_path, params: { search: "chicken" }
    must_respond_with :success
  end

end
