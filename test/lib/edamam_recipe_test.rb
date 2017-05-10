require 'test_helper'

describe EdamamRecipe do


  describe "initialize" do
    it "Takes a hash as an argument" do
      hash = {uri: "something"}
      object = EdamamRecipe.new(hash)
      object.must_be_kind_of EdamamRecipe
    end

    it "requires a uri" do
      proc{
        EdamamRecipe.new({})
      }.must_raise ArgumentError
    end

    it "Accepts a label as argument" do
      hash = {uri: "something", label: "The namen of the recipe"}
      object = EdamamRecipe.new(hash)
      object.label.must_equal "The namen of the recipe"
    end

    it "Accepts a image as argument" do
      hash = {uri: "something", image: "a_image.png"}
      object = EdamamRecipe.new(hash)
      object.image.must_equal "a_image.png"
    end

  end #END of describe "initialize"

  describe "self.search" do
    it "returns a Array" do
      VCR.use_cassette("recipes1") do
        recipes = EdamamRecipe.search("chicken")
        recipes.must_be_kind_of Array
      end
    end

    it "returns a Array with two elements" do
      VCR.use_cassette("recipes1") do
        recipes = EdamamRecipe.search("chicken")
        recipes.length.must_equal 2
      end
    end

    it "returns a Array with two elements, where the first element is an array of length 10" do
      VCR.use_cassette("recipes1") do
        recipes = EdamamRecipe.search("chicken")
        recipes[0].must_be_kind_of Array
        recipes[0].length.must_equal 10
      end
    end

    it "returns a Array with two elements, where the second element is a integer, 1000" do
      VCR.use_cassette("recipes1") do
        recipes = EdamamRecipe.search("chicken")
        recipes[1].must_be_kind_of Integer
        recipes[1].must_equal 1000
      end
    end

    it "returns a Array with two elements for a search with no hits" do
      VCR.use_cassette("nohits") do
        recipes = EdamamRecipe.search("kajndao")
        recipes.length.must_equal 2
      end
    end

    it "first element in the return is an empty array for a search with no hits" do
      VCR.use_cassette("nohits") do
        recipes = EdamamRecipe.search("kajndao")
        recipes[0].must_equal []
      end
    end

    it "first element in the return is an empty array for a search without a search text" do
      VCR.use_cassette("no_search_text") do
        recipes = EdamamRecipe.search(nil)
        recipes[0].must_equal []
      end
    end

    it "returns nil for a search without a search text and from and to set to nil" do
      VCR.use_cassette("all_nil") do
        recipes = EdamamRecipe.search(nil, nil, nil)
        # assert_nil recipes
        recipes[0].must_equal []
      end
    end

  end # END of describe "self.search"


  describe "self.show" do

    it "returns an array " do
      VCR.use_cassette("recipe_1") do
        id = "recipe_74c93392d94076bbb845596ee887a130"
        recipe = EdamamRecipe.show(id)
        recipe.must_be_kind_of Array
      end
    end

    it "returns an array for a bogus id number" do
      VCR.use_cassette("false_id") do
        id = "recipebbb845596ee887a130"
        recipe = EdamamRecipe.show(id)
        recipe.must_be_kind_of Array
      end
    end

    it "returns an empty array for a bogus id number" do
      VCR.use_cassette("false_id") do
        id = "recipebbb845596ee887a130"
        recipe = EdamamRecipe.show(id)
        recipe.must_equal []
      end
    end

    it "returns an empty array for an empty id number" do
      VCR.use_cassette("nil_id") do
        id = nil
        recipe = EdamamRecipe.show(id)
        recipe.must_equal []
      end
    end

  end # END of describe "show"


end # END of describe SlackChannel
