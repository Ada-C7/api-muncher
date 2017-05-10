require "test_helper"

describe SearchesController do
  it "should get index" do
    VCR.use_cassette("edmam") do
      get root_path
      must_respond_with :success
    end
  end
end
