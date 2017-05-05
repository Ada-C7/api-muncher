require 'test_helper'

describe EdamamApiWrapper do

  describe "Testing self.search" do
    it "can get a list of recipes" do
      VCR.use_cassette("edamam") do

        recipes = EdamamApiWrapper.search("apple")
        recipes.must_be_instance_of Array

        recipes.each do |recipe|
          recipe.must_be_instance_of Recipe
        end
      end
    end
  end
end
