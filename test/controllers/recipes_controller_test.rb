require "test_helper"

describe RecipesController do
  before do
    VCR.insert_cassette("edamam")
  end

  after do
    VCR.eject_cassette("edamam")
  end

  it "should get index page with no search" do
    get recipes_path
    must_respond_with :success
  end

  it "should get recipes list with a search term" do
    get recipes_path, params: { search: "broccoli" }
    must_respond_with :success
  end

  it "should get recipes list with search & page params" do
    get recipes_path, params: {search: "broccoli", page: "2"}
    must_respond_with :success
  end

  it "should get individual recipe with valid id" do
    get recipe_path("938758bcb9dc1de7953ee80525102921")
    must_respond_with :success
  end

  it "should redirect to 404 if given a bad recipe id" do
    get recipe_path("badID")
    must_respond_with :missing
  end
end
