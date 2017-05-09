require 'test_helper'

describe EdamamApiWrapper do
  describe "Testing self.search(search_term)" do
    it "Can get a response of search results" do
      VCR.use_cassette("edamam") do

        recipes = EdamamApiWrapper.search(params[:search_term])

        recipes.must_be_instance_of Array
        #recipes.class.must_equal array
        recipes.each do |recipe|
          recipe.must_be_instance_of Recipe
        end
      end
    end
  end

    it "returns an empty array with a bad token" do
      VCR.use_cassette("edamam") do

        recipes = EdamamApiWrapper.search("Bad token")
        recipes.must_equal []
      end
    end

    describe "Get a recipe do" do
      it "Can get a recipe given a valid recipe label" do
      end

      it "returns false for an invalid recipe" do
      end
    end
  end
