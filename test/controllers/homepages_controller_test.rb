require "test_helper"

describe HomepagesController do
  it "gets index" do
    get root_path
    must_respond_with :success
  end

  it "gets list" do
    VCR.use_cassette("recipe") do
      get list_recipes_path, params: {"search_term" => "carrot", "page" => "1"}
      must_respond_with :success
    end
  end

  it "responds with redirect if no search term provided" do
    VCR.use_cassette("recipe") do
      get list_recipes_path, params: {"search_term" => "", "page" => "1"}

      must_respond_with :redirect
      must_redirect_to root_path
      flash[:warning].must_equal "please enter search term"
    end
  end

  it "gets show" do
    VCR.use_cassette("recipe") do
      get show_recipe_path("e589c5928a67f58cddbe4f7ac3b67919")
      must_respond_with :success
    end
  end

  it "should show 404 when recipe not found" do
    VCR.use_cassette("recipe") do
      get show_recipe_path("stupid")
      must_respond_with :missing
    end
  end
end
