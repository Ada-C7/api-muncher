require 'test_helper'

describe EdamamApiWrapper do
  describe "Testing Self.search" do
    #Anything inside block will use this casette
    it "can get a list of recipes with search terms" do
      VCR.use_cassette("edamam") do
        results = EdamamApiWrapper.search("chicken pasta")
        results.must_be_instance_of Array
        results.each do |result|
          result.must_be_instance_of Recipe
        end
      end
    end

    it "if there are no search results, should return empty array" do
      VCR.use_cassette("edamam") do
        results = EdamamApiWrapper.search("")
        results.must_equal []
      end
    end

    it "if the request has no mroe results to display, should return empty array" do
      VCR.use_cassette("edamam") do
        results = EdamamApiWrapper.search("chicken", 1000, 1010)
        results.must_equal []
      end
    end
  end


  describe "Testing self.getRecipe" do
    it "can get a one recipe with uri" do
      VCR.use_cassette("edamam") do
        recipe = EdamamApiWrapper.getRecipe("http://www.edamam.com/ontologies/edamam.owl%23recipe_637913ec61d9da69eb451818c3293df2")
        recipe.must_be_instance_of Recipe
        recipe.name.must_equal "Dijon and Tarragon Grilled Chicken"
      end
    end

    it "requires a uri to access recipe" do
      proc {EdamamApiWrapper.getRecipe()}.must_raise ArgumentError
    end

    it "should return nil for an invalid recipe uri" do
      VCR.use_cassette("edamam") do
        recipe = EdamamApiWrapper.getRecipe("bad-URI")
        recipe.must_be_nil

        recipe = EdamamApiWrapper.getRecipe("https://bad-URI")
        recipe.must_be_nil
      end
    end
  end
end
