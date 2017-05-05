require "test_helper"

describe SearchesController do
  it "should get index" do
    VCR.use_cassette("edmam")
    get searches_index_path
    must_respond_with :success
  end

end
