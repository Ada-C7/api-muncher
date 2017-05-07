require "test_helper"

describe RecipesController do
  describe "welcome" do
    it "succeeds" do
      get welcome_path
      must_respond_with :success
    end
  end

  describe "index" do
    it "succeeds when recipes are returned" do
      get recipes_path
      must_respond_with :success
    end
  end
  #   it "succeeds with no users" do
  #     # Start with a clean slate
  #     Vote.destroy_all # for fk constraint
  #     User.destroy_all
  #
  #     get users_path
  #     must_respond_with :success
  #   end
  # end



end
