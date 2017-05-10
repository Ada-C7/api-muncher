require "test_helper"

describe SessionsController do

  describe "#create" do

    # this is not actually hitting the new user block
    it "creates a new user" do

      User.find_by(provider: "faker", uid: "999").must_equal nil

      proc {
        get root_path
        must_respond_with :success
        post login_path(provider:"faker", uid:"999")
      }.must_change 'User.count', 1
    end

    it "logs in an existing user" do
      proc {
        post login_path(users(:aurora))
        must_respond_with :success
      }
    end

    it "won't log in without uid" do
      get login_path
      post login_path(provider: users(:aurora).provider)
      session[:current_user].must_equal nil
    end

    it "won't log in without provider" do

    end

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
