require 'test_helper'

describe EdamamRecipes do
  # describe "initialize" do
  #
  # end

  describe "self.get_recipes" do
    it "can get recipes for a valid search" do
      VCR.use_cassette("responses") do
        response = EdamamRecipes.get_recipes("chicken")
        # response.class.must_be_kind_of Hash
      end
    end

    it "fails to get recipes for a bogus search" do
      VCR.use_cassette("responses") do
        response = EdamamRecipes.get_recipes("fkhtgn")
        proc {
          response = EdamamRecipes.get_recipes("fkhtgn")
        }.must_raise EdamamRecipes::EdamamException
      end
    end
  end

end
