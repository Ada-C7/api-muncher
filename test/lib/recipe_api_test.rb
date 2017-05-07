require 'test_helper'

describe Recipe do
  describe "initialize" do
    it "Takes a name" do
      name = "TestRecipe"
      recipe = Recipe.new(name: name)
      recipe.name.must_equal name
    end

    it "Takes an image URL" do
      img_url = "Test"
      recipe = Recipe.new(img_url: img_url)
      recipe.img_url.must_equal img_url
    end

    it "Takes a uri" do
      uri = "Test"
      recipe = Recipe.new(uri: uri)
      recipe.uri.must_equal uri
    end

    it "Takes an id" do
      id = "Test"
      recipe = Recipe.new(id: id)
      recipe.id.must_equal id
    end

    it "Takes an URL" do
      url = "Test"
      recipe = Recipe.new(url: url)
      recipe.url.must_equal url
    end

    it "Takes ingredients in the form of an array" do
      ingredients = ["fish", "carrots"]
      recipe = Recipe.new(ingredients: ingredients)
      recipe.ingredients.must_equal ingredients
    end

    it "Takes nutritional information in the form of a hash" do
      total_nutrients = {:potassium => "20kg", :vitamin_d => "1mg"}
      recipe = Recipe.new(total_nutrients: total_nutrients)
      recipe.total_nutrients.must_equal total_nutrients
    end

    it "Requires information for a Recipe to be created" do
      proc {
        Recipe.new
      }.must_raise ArgumentError
    end
  end

  describe "send" do
      it "Can send a message to a real channel" do
        VCR.use_cassette("channels") do
          channel = SlackChannel.new("queues_api_testing")
          channel.send("test message")

        end
      end

      it "Fails to send to a bogus channel" do
        VCR.use_cassette("channels") do
          channel = SlackChannel.new("this_channel_doesnt_exit")
          proc {
            channel.send("test message")
          }.must_raise SlackChannel::SlackException
        end
      end
  end
end
