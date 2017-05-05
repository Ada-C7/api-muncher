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
    search.must_be_kind_of Array
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
      sc = EdamamRecipes.new(hash)
      search.image.must_equal "https://www.edamam.com/web-img/059/059530cddca8fe8be448b9c1beb70632.jpg"

    end

    # it "Requires a uri" do
    #   proc {
    #       EdamamRecipes.new
    #   }.must_raise ArgumentError
    # end
    #
    # it "Requires a label" do
    #   proc {
    #       EdamamRecipes.new
    #   }.must_raise ArgumentError
    # end
    #
    # it "Requires a image" do
    #   proc {
    #       EdamamRecipes.new
    #   }.must_raise ArgumentError
    # end
  end

  describe "self.get_recipes" do
    it "can get recipes for a valid search" do
      VCR.use_cassette("responses") do
        response = EdamamRecipes.get_recipes("chicken")
        # response.class.must_be_kind_of Hash
      end
    end

#voluntary according to dan
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
