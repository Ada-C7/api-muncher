require "test_helper"

describe RecipesController do

  describe "initilize" do
    it "takes a name" do
      name = "test recipe"
      r = Recipe.new(name)
      r.name.must_equal name
    end
  end

  it "requires a name" do
    proc {
      Recipe.new
    }.must_raise ArgumentError
  end


  describe "send" do
    it "can send a message t a real channel " do
      VCR.use_cassette("channels") do
        channel = recipe.new('ques_api_testing')
          channel.send("test message")
      end
    end

    it "fails to send bogus channel" do
      VCR.use_cassette("channels") do
        channel = Recipe.new("fake_recipe")
        proc {
          channel.send("test message")
          }.must_raise Recipe::RecipeException
      end



  end


end
