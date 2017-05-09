require 'test_helper'

describe "EdamamApiWrapper" do
  describe "self.search(search_term)" do
    it "can get list of search results" do
      VCR.use_cassette("edamam") do
        recipes = EdamamApiWrapper.search("potato")

        recipes.must_be_instance_of Array
        #channels.class.must_equals array

        recipes.each do |recipe|
          recipe.must_be_instance_of Recipe
        end
      end
    end

    it "will return an empty array with a bad search" do
      VCR.use_cassette("edamam") do
        recipes = EdamamApiWrapper.search(".")

        recipes.must_equal []
      end
    end
  end

  describe "self.getRecipe" do
    it "will get one recipe" do
      VCR.use_cassette("edamam") do
        recipes = EdamamApiWrapper.search("potato")

        recipe = EdamamApiWrapper.getRecipe(recipes[0].uri)

        recipe.must_be_instance_of Recipe

        recipe.label.must_equal recipes[0].label
      end
    end

    # Do we need to test for this since uri comes from click????

    # it "will return nil for an invalid uri" do
    #   VCR.use_cassette("edamam") do
    #
    #     recipe = EdamamApiWrapper.getRecipe("bad_uri")
    #     recipe.wont_be_instance_of Recipe
    #     recipe.must_equal nil
    #   end
    # end


  end
end
