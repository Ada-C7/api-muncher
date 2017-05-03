require "test_helper"

describe RecipesController do
  it "should get index with no search term" do
    VCR.use_cassette("recipes") do
      get root_path
      must_respond_with :success
    end
  end

  it "should also get index with the results of a search" do
    VCR.use_cassette("recipes") do
      search_data = {
        search_term: "banana"
      }
      get root_path, params: search_data
      must_respond_with :success
    end
  end

  
end
