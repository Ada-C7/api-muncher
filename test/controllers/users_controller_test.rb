require "test_helper"

describe UsersController do


  describe "#account" do

    it "should get the account page" do
      proc {post login_path(users(:aurora))
      must_respond_with :success
      get account_path
      must_respond_with :success}
    end

    it "if user has no saved recipes should succeed" do
      proc {
        post login_path, params: { user: users(:aurora)}
        post save_search_path, params: { search: { search_terms: "pink lady", health: "vegetarian", user: users(:aurora)}}
        get account_path
        must_respond_with :success
      }
    end

    it "if user has no saved searches should succeed" do

    end

  end
end
