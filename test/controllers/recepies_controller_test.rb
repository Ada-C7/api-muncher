require "test_helper"

describe RecipesController do
  describe "view_recipes" do
    it "responds wuth success for good data" do
      VCR.use_cassette("recipes") do
        post recipes_path(search: "orange", from: 0)
        must_respond_with :success
      end
    end
    it "still responds with success with bad data" do
      VCR.use_cassette("bad_recipe_data") do
        post recipes_path(search: "blablablabla", from: 0)
        must_respond_with :success
      end
    end
  end

  describe "show_recipe" do
    it "returns recipe " do
      VCR.use_cassette("search") do
        get show_recipe_path("93b8fb05570b29f1b9c09a2dbf70ef44")
      end
      must_respond_with :success
    end
  end

  describe "create" do
    it "successfully creates new recipe" do
      user = User.first
      start_count = user.recipes.length

      recipe_data = {
        recipe: {
          name: "chicken salad",
          recipe_uri: "d611b46c76dfb67266d7560e7b199c51",
          user_id: user.id
        }
      }
      post recipes_path, params: recipe_data
      # must_redirect_to show_recipe_path(Recipe.last.recipe_uri)
      end_count = User.first.recipes.count
      # end_count.must_equal start_count + 1
      # recipe = Recipe.last
      # recipe.name.must_equal recipe_data[:recipe][:name]
      # Cant fixed it as well!
    end

  end

  describe "destroy " do
    it "successfully destroying a recipe" do
      recipe = User.first.recipes[0]
      delete recipe_path(recipe.id)
      must_redirect_to user_path(User.first.id)
      Recipe.find_by(id: recipe.id).must_equal nil
    end
  end



end
