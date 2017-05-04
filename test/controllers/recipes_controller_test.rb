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

  it "should succeed for an existing recipe" do
    VCR.use_cassette("recipes") do
      id = "b09d5c2009adc8ea164d4b50d7398baa"
      get show_recipe_path(id)
      must_respond_with :success
    end

  end

  it "renders 404 for a bad recipe id" do
    VCR.use_cassette("recipes") do
      id = "totally_made_up_id"
      get show_recipe_path(id)
      must_respond_with :not_found
    end

  end


end
