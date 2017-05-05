require 'test_helper'

describe EdamamApiWrapper do
  describe "self.listRecipes(search_term, page)" do
    it "Gets a list of recipes" do
      VCR.use_cassette("recipe") do
        recipes = EdamamApiWrapper.listRecipes("carrot", "1")

        recipes.must_be_instance_of Array
        recipes.each do |recipe|
          recipe.must_be_instance_of Recipe
        end
        recipes.first.name.must_equal "Carrots Braised in Beer and Carrot Juice"
      end
    end
    # this method has no paramters, if it had, we could test what would happen
    # it we gave it a broken parameter
    # if we pass it token as a prameter, the only way for it to fail is to have invalid token
    it "Returns an empty array with a bad parameter" do
      VCR.use_cassette("recipe") do
        channels = EdamamApiWrapper.listRecipes("stupid", 0)
        channels.must_equal []
      end
    end
  end

  # describe "Get a channel" do
  #   it "Can get a channel given a valid channel id" do
  #     VCR.use_cassette("slack") do
  #       id = "C557BP9QE"
  #       channel = SlackApiWrapper.getChannel(id)
  #       channel.must_be_instance_of Channel
  #       channel.name.must_equal "stacks_api_testing"
  #     end
  #   end
  #
  #   it "Returns false for an invalid channel id" do
  #     VCR.use_cassette("slack") do
  #       id = "bad id"
  #       channel = SlackApiWrapper.getChannel(id)
  #       channel.wont_be_instance_of Channel
  #       channel.must_be_nil
  #     end
  #   end
  # end
  #
  # describe "Send Message" do
  #   it "Can send a message to a valid channel" do
  #
  #   end
  #
  #   it "Returns false when sending a message fails" do
  #
  #   end
  #
  #   it "requires a channel and a message" do
  #
  #   end
  # end
end
