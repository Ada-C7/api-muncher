require 'test_helper'

describe "SearchApiWrapper" do

  describe "Testing self.listRecipes" do

    it "Can get a list of recipes" do
      VCR.use_cassette("recipe") do
        recipes = SearchApiWrapper.listRecipes("chicken")
        recipes.must_be_instance_of Array
        recipes.each do |recipe|
          recipe.must_be_instance_of Recipe
        end
      end
    end
    it "Will return an empty array with a bad token" do
      VCR.use_cassette("recipe") do

        channels = SlackApiWrapper.listChannels("Bad token")
        channels.must_equal []
      end
    end

  end





end
