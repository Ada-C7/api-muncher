require "test_helper"

describe RecipesController do
  before do
    VCR.insert_cassette("recipe")
  end

  after do
    VCR.eject_cassette("recipe")
  end

  it "Should get index" do
    get recipes_path
    must_respond_with :success
  end

end
