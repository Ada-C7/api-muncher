require "test_helper"

describe UsersController do


  describe "#account" do

    it "should get the account page" do
      post login_path, params: { user: { provider: "aurora", uid: "123"}}
      get account_path
      must_respond_with :success
    end

  end
end
