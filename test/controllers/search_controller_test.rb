require "test_helper"

describe SearchController do
  it "can get root" do
    get root_path
    must_respond_with :success
  end
end
