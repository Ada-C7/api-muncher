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

  it "gets show" do
    VCR.use_cassette("recipe") do
      get show_recipe_path("e589c5928a67f58cddbe4f7ac3b67919")
      must_respond_with :success
    end
  end
end
