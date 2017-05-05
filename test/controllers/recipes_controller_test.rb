require "test_helper"

describe RecipesController do

  describe "#create" do
    it "must be able to create a recipe" do skip
      post login_path(users(:aurora).id)
      post save_recipe_path(recipes(:chicken).id)
      must_redirect_to account_path
    end
  end

  describe "#destroy" do
    it "must be able to destroy a recipe" do skip
      post login_path(users(:aurora).id)
      post save_recipe_path(recipes(:chicken).id)
      proc {
        delete delete_recipe_path(recipes(:chicken).id)
      }.must_change 'Recipe.count', -1
    end
  end

end
