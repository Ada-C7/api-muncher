require 'test_helper'

describe EdamamRecipes do
  # describe "initialize" do
  #
  # end

  describe "get_recipes" do
    it "can get recipes for a valid search" do
      VCR.use_cassette("responses") do
        response = EdamamRecipes.new
        response.get_recipes("chicken")
      end
    end

    it "fails to get recipes for a bogus search" do
      VCR.use_cassette("responses") do
        response = EdamamRecipes.new
        response.get_recipes("fkhtgn")
        proc {
          response.get_recipes("fkhtgn")
        }.must_raise EdamamRecipes::EdamamException
      end
    end
  end

end
