require "test_helper"

describe SearchesController do

  it "should get the root page form" do
    VCR.use_cassette("munch") do
      get root_path
      must_respond_with :success
    end
  end

  it "should get the result list page" do
    VCR.use_cassette("munch") do
      get results_path(q: "apple")
      must_respond_with :success
    end
  end

  it "should get the show recipe page" do
    VCR.use_cassette("munch") do
      get recipe_path("2e10a939a6a800da90f4460be18b4851")
      must_respond_with :success
    end
  end

  it "should get filtered diet result page" do
    VCR.use_cassette("munch") do
      get diet_path(id: "celery", label: "Low-Carb")
      must_respond_with :success
    end
  end

end
