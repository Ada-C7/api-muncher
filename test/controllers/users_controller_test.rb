require "test_helper"

describe UsersController do


  describe "#account" do

    it "should get the account page" do skip
      post login_path(users(:aurora).id)
      get account_path
      must_respond_with :success
    end

  end
end
