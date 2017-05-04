require 'test_helper'

describe Recipe do


  let(:recipe_params) { {name: "food", image:"picture of food", id: 2345, original_url: "url"} }
  let(:new_recipe) {Recipe.new(recipe_params)}

  describe "initialize" do
    it "Takes a hash, and assigns name, image, id, original_url" do
      new_recipe.name.must_equal recipe_params[:name]
    end

    it "Requires a hash" do
      proc {
        Recipe.new
      }.must_raise ArgumentError
    end
  end

  describe "search" do
    it "Can search for recipes based on a search term, and returns and array of recipes" do
      VCR.use_cassette("recipes") do
        recipes = Recipe.search("blueberry")
        recipes.class.must_equal Array

        recipes.each do |recipe|
          recipe.class.must_equal Recipe
        end
      end
    end

    it "Can returns an empty array of if given a bogus search term" do
      VCR.use_cassette("recipes") do
        recipes = Recipe.search("XXXXXXX")
        recipes.class.must_equal Array
        recipes.lentgh.must_equal 0
      end
    end






  end
    #   it "Fails to send to a bogus channel" do
    #     VCR.use_cassette("channels") do
    #       channel = SlackChannel.new('this_channel_doesnt_exist')
    #       proc {
    #         channel.send("test message")
    #       }.must_raise SlackChannel::SlackException
    #     end
    #   end
    # end


end
