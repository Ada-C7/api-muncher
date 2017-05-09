require "test_helper"

describe RecipesController do
  before do
    VCR.insert_cassette("show_recipe")
  end
  after do
    VCR.eject_cassette("show_recipe")
  end

  describe "index" do
    it "gets root path" do
      get root_path
      must_respond_with :success
    end

    describe "show" do
      it "can show a recipe" do skip 
        recipe = EdamamApiWrapper.show_recipe("http://www.edamam.com/ontologies/edamam.owl%23recipe_637913ec61d9da69eb451818c3293df")
        puts recipe.inspect
        get recipes_show_path(recipe.uri)

        must_respond_with :success
      end
    end
  end
end
