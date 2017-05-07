require "test_helper"

describe HomeController do
  it "should get show" do
    get home_show_url
    value(response).must_be :success?
  end

end
