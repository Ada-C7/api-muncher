require "test_helper"

describe EdamamApiWrapper do
  describe "API functionality" do
    it "Can get a list of recipes from a real search" do
      VCR.use_cassette("recipes") do
        query = "test"
        response = EdamamApiWrapper.find_recipes(query)
        response["count"].must_be :>, 1
        # response search must equal...
      end
    end

    it "Can get a list of recipes from a fake search" do
      skip
      VCR.use_cassette("recipes") do
        response = EdamamApiWrapper.find_recipes("invalid search", "test search")
        response["ok"].must_equal false
        response["error"].wont_be_nil
      end
    end
  end
end
