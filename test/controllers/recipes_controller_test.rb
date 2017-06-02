require "test_helper"

describe RecipesController do

  describe "#create" do
    it "successfully create a recipe" do

      proc {
        post login_path, params: { user: users(:aurora)}
        post save_recipe_path, params: { recipe: {name: "oh god just pass", recipe_url: "a url", user_id: users(:aurora).id}}
      must_respond_with :success
      }
    end

    it "redirects upon saving recipe" do

      post login_path, params: { user: users(:aurora)}
      proc {
        post save_recipe_path, params: { recipe: recipes(:chicken)}
      must_redirect_to account_path}
    end
  end


  describe "#destroy" do
    it "must be able to destroy a recipe" do
      post login_path, params: { user: users(:aurora)}
      proc{
        delete delete_recipe_path(recipes(:chicken).id) }.must_change 'Recipe.count', -1
      end
    end

  end
