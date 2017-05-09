require "test_helper"

describe SearchesController do
  describe "index" do
    it "shows the homepage" do
      get root_path
      must_respond_with :success
    end
  end

  describe "show" do
    it "gives shows a recipe" do
      skip
      VCR.use_cassette("results") do
        uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_f1c853a77986214680bbdd424883499a"
        get show_path
        must_respond_with :success
      end
    end
  end
end
