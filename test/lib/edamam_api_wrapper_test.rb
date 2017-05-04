require 'test_helper'

describe EdamamApiWrapper do
  before do
    VCR.insert_cassette("edamam")
  end

  after do
    VCR.eject_cassette("edamam")
  end

  describe "#listRecipes method" do
    it "can get a list of channels" do
      recipes = EdamamApiWrapper.listRecipes("taiwanese")

      recipes.must_be_instance_of Array
      recipes.each do |recipe|
        recipe.must_be_instance_of Recipe
      end
    end

    it "will return empty array with a bad query" do
      recipes = EdamamApiWrapper.listRecipes("jkhg76987")

      recipes.must_equal []
    end

    # it "will return empty array with no query" do     ## this one takes a reeeeeeeally long time
    #   recipes = EdamamApiWrapper.listRecipes("")
    #
    #   recipes.must_equal []
    # end
  end

  describe "#getRecipe method" do
    it "can get a recipe given a valid uri" do
      channel = SlackApiWrapper.getChannel("C557BP9QE")

      channel.must_be_instance_of Channel
      channel.id.wont_be_nil

    end

    it "returns false for an invalid channel id" do
      VCR.use_cassette("slack") do
        channel = SlackApiWrapper.getChannel("nope")
        channel.wont_be_instance_of Channel
        channel.must_be_nil
      end
    end
  end
end
