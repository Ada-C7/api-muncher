require "test_helper"

describe SessionsController do

  describe "#create" do

    # this is not actually hitting the new user block
    it "creates a new user" do skip
      user = User.create(provider: "felix", uid: "555")

      post login_path, params: { user: user}
      must_redirect_to :root
    end

    it "logs in an existing user" do
      post login_path, params: { user: { provider: "aurora", uid: "1234"}}
      must_respond_with :success
    end

    # it "redirects to root after logging user in" do
    #
    # end

  end

  describe "#logout" do

    it "logs user out" do
      delete logout_path
      must_redirect_to :root
    end

  end

  describe "#loginform" do
    it "gets login form" do
      get login_form_path
      must_respond_with :success
    end
  end

end
