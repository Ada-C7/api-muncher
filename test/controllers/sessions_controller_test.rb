require "test_helper"

describe SessionsController do

  describe "create" do
    # it "register a new user"do
    #   start_count = User.count
    #   user = User.new(provider: "google", uid: 99999, name: "test_user", email: "test@user.com")
    #   OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new(mock_auth_hash(user))
    #   get auth_callback_path(:google)
    #   must_redirect_to root_path
    #   User.count.must_equal start_count + 1
    #   session[:user_id].must_equal User.last.id, "User was not logged in"
    #  end
    # #
    # it "accepts a returning user"do
    #   start_count = Merchant.count
    #   merchant = merchants(:grace)
    #   login(merchant)
    #   must_redirect_to root_path
    #   session[:user_id].must_equal merchant.id
    #   Merchant.count.must_equal start_count
    # end
    #
    # it "rejects incomoplete oauth data" do
    #   start_count = Merchant.count
    #   user = Merchant.new(oauth_provider: "github", oauth_id: 99999)
    #   OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(mock_auth_hash(user))
    #   get auth_callback_path(:github)
    #   must_redirect_to root_path
    #   Merchant.count.must_equal start_count
    #   session[:user_id].must_equal nil
    # end
  end


end
