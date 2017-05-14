require "test_helper"

describe RecipesController do
  it "should get search" do
    get search_path
    value(response).must_be :success?
  end

  describe "index" do
    it "returns status 200" do
      VCR.use_cassette("recipes") do
        query = "chicken"
        page = "2"
        get recipes_path(params: page), params:{ q: query }
        must_respond_with :ok
      end
    end
  end
end
