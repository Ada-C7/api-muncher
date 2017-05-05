require "test_helper"

describe SearchesController do
  it "should get index" do
    get searches_index_url
    value(response).must_be :success?
  end

end
