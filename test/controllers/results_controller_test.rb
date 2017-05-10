require "test_helper"

describe ResultsController do
  it "should get index" do
    VCR.use_cassette("edmam") do
      get results_path, :q => "beans", :from => 1, :to => 11
      must_respond_with :success
    end
  end

end
