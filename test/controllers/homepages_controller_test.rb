require 'test_helper'

describe HomepagesController do
  it "should get root path" do
    VCR.use_cassette("recipes") do
      get root_path
      must_respond_with :success
    end
  end

  it "should get a list of recipes" do
    VCR.use_cassette("recipes") do
      get result_list_path, params: { :q => "chicken", :page => "0" }
      must_respond_with :success
    end
  end

  it "should get a recipe page" do
    VCR.use_cassette("recipes") do
      get recipe_details_path, params: { :uri => "http://www.edamam.com/ontologies/edamam.owl#recipe_c748acc6945e3ed9b8e46d6f6489f781"}
      must_respond_with :success
    end
  end
end
