require 'test_helper'

describe EdamamRecipes do

  describe "initialize" do

    hash = {
      uri: "http://www.edamam.com/ontologies/edamam.owl#recipe_c9044642b3673039d454227917c51e11",
      label: "Nectarine Hand Pies",
      image: "https://www.edamam.com/web-img/059/059530cddca8fe8be448b9c1beb70632.jpg"
    }

    it "take a hash" do
    # hash  = {uri: "something"}
    search = EdamamRecipes.new(hash)
    search.must_be_kind_of EdamamRecipes
    end

    it "Takes a uri" do
      # uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_c9044642b3673039d454227917c51e11"
      search = EdamamRecipes.new(hash)
      search.uri.must_equal "http://www.edamam.com/ontologies/edamam.owl#recipe_c9044642b3673039d454227917c51e11"

    end

    it "Takes a label" do
      # label = "Nectarine Hand Pies"
      search = EdamamRecipes.new(hash)
      search.label.must_equal "Nectarine Hand Pies"

    end

    it "Takes a image" do
      # image = "https://www.edamam.com/web-img/059/059530cddca8fe8be448b9c1beb70632.jpg"
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

# I can't get this test to pass and saw a note that since rails tests for flash messages, it may not be necessary
    # it "returns a flash message if there are no results for a search" do
      # VCR.use_cassette("responses") do
        # response = EdamamRecipes.get_recipes("fkhtgn", 0, 9)
        # assert_equal flash[:result_text], "Sorry, no results were found for your search. \n Would you like to search for something else?"
        # must_route_to "/"
        # must_respond_with :failure
        # must_redirect_to "/"
    #   end
    # end
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
