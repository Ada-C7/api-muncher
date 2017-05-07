require "test_helper"

describe RecipesController do
  describe "index" do
    it "gets root path" do
      VCR.use_cassette("recipes") do
        get recipe_search_path
        must_respond_with :success
      end
    end
  end

end
