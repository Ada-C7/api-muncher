require "test_helper"

describe UsersController do
  it "creates a new user" do
    start_count = User.count
    user = User.new(provider: "google", uid: 99999, name: "test_user", oauth_token: "string of thigns", oauth_expires_at: Time.new(2018))
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(mock_auth_hash(user))
    get "/auth/google_oauth2/callback"
    must_redirect_to root_path

    User.count.must_equal start_count + 1
  end

  it "doesn't log in a bad user" do


  end

  it "logs in an existing user" do
    start_count = User.count
    user = users(:wolf)
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(mock_auth_hash(user))
    get "/auth/google_oauth2/callback"

    must_redirect_to root_path
    User.count.must_equal start_count
  end

  it "logs out an existing user" do
    start_count = User.count
    user = users(:wolf)
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(mock_auth_hash(user))
    get "/auth/google_oauth2/callback"

    get "/signout"
    must_redirect_to root_path
    User.count.must_equal start_count
  end
end
