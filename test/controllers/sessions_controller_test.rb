require "test_helper"

describe SessionsController do
  it "should get create" do
    get signin_path
    must_respond_with :success
  end

  it "should get destroy" do
    get signout_path
    must_respond_with :success
  end

end
