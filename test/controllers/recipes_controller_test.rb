require "test_helper"

describe RecipesController do
  before do
    VCR.insert_cassette("edamam")
  end
  after do
    VCR.eject_cassette("edamam")
  end

  describe "index" do
    it "gets root path" do
    get root_path
    must_respond_with :success
  end

  describe "show" do
    it "can show a recipe" do
      get recipes_show_path, params: { recipe: {
        name: "name",
        uri: "uri",
        image: "image"
        }}
      must_respond_with :success
    end
  end
end
end
