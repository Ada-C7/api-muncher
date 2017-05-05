require 'test_helper'

describe EdamamApiWrapper do

  describe "Testing self.search" do
    before do
      VCR.insert_cassette("edamam")
    end
    after do
      VCR.eject_cassette("edamam")
    end

    it "can get a list of recipes" do
      recipes = EdamamApiWrapper.search("apple")
      recipes.must_be_instance_of Array

      recipes.each do |recipe|
        recipe.must_be_instance_of Recipe
      end
    end

    it "will return an empty array with invalid arguments for edamam" do
      recipes = EdamamApiWrapper.search("a")
      recipes.must_equal []
    end
  end
end
