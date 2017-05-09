require 'test_helper'

describe EdamamRecipes do

  describe "initialize" do

    hash = {
      uri: "http://www.edamam.com/ontologies/edamam.owl#recipe_c9044642b3673039d454227917c51e11",
      label: "Nectarine Hand Pies",
      image: "https://www.edamam.com/web-img/059/059530cddca8fe8be448b9c1beb70632.jpg"
    }

    it "take a hash" do
    search = EdamamRecipes.new(hash)
    search.must_be_kind_of EdamamRecipes
    end

    it "Takes a uri" do
      search = EdamamRecipes.new(hash)
      search.uri.must_equal "http://www.edamam.com/ontologies/edamam.owl#recipe_c9044642b3673039d454227917c51e11"

    end

    it "Takes a label" do
      search = EdamamRecipes.new(hash)
      search.label.must_equal "Nectarine Hand Pies"

    end

    it "Takes a image" do
      search = EdamamRecipes.new(hash)
      search.image.must_equal "https://www.edamam.com/web-img/059/059530cddca8fe8be448b9c1beb70632.jpg"

    end
  end

  describe "self.get_recipes" do
    it "can get recipes for a valid search" do
      VCR.use_cassette("responses") do
        response = EdamamRecipes.get_recipes("pie", 0, 9)
        response.must_be_kind_of Array
      end
    end
  end

  describe "self.find_recipe" do
    it "returns info about a particular recipe" do
      VCR.use_cassette("responses") do
        response = EdamamRecipes.find_recipe("recipe_c9044642b3673039d454227917c51e11")
        response[0]["label"].must_equal "Nectarine Hand Pies"
        response.must_be_kind_of Array
      end
    end

  end

end
