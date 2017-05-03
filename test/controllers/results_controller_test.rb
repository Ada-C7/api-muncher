require "test_helper"

describe ResultsController do
  it "should get index" do
    get results_index_url
    value(response).must_be :success?
  end

end
