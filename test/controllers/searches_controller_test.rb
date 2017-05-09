require "test_helper"

describe SearchesController do
  before do
    VCR.insert_cassette("edamam")
  end

  after do
    VCR.eject_cassette("edamam")
  end

  describe "#index" do

    it "must get index" do
      get root_path
      must_respond_with :success
    end

  end

  describe "#recipes" do

    it "must get recipes page" do
      get recipes_path
      must_respond_with :success
    end

    it "must get a search" do
      get recipes_path(search_terms: "pink food", from: 0, to: 12, health: "vegetarian")
      must_respond_with :success

    end

  end
  # this isn't working
  describe "#recipe" do
    it "should get a single recipe successfully" do 
      real_uri = "http://www.edamam.com/ontologies/edamam.owl%23recipe_b63034f899ef1b5c7c939ec7e1ca6b1b"
      recipe = EdamamApiWrapper.getRecipe(uri: real_uri)
      recipe.must_be_instance_of RecipeResult
      # get recipe_path(recipe.uri)
      # must_respond_with :success
    end

    it "should get the recipe page" do skip
      recipe = RecipeResult.create("pink toast", "image_url", "http://www.edamam.com/ontologies/edamam.owl%23recipe_b63034f899ef1b5c7c939ec7e1ca6b1b")
      get recipe_path(uri: recipe.uri)
      must_respond_with :success
    end

    it "should show a nice error message if it can't get it" do skip

    end
  end

  describe "#create" do

    it "can create a search" do skip
      proc { post save_search_path, params: { search:
                { search_terms: "pink lady",
                  health: "vegetarian",
                  user_id: 1
                }
              }
            }.must_change 'Search.count', 1
    end


    it "successfully saves a search" do skip
      post save_search_path()
    end

  end

  describe "#destroy" do

    it "successfully destroys a saved search" do skip
    end
  end

  # how the heck do I test this??
  describe "next" do
    it "next will get 10 different recipes" do skip

    end

    it "next will not go further if there aren't more recipes" do skip

    end


  end

  describe "prev" do
    it "prev will get 10 different recipes" do

    end

    it "prev will not go back if no prev recipes" do

    end
  end

end
