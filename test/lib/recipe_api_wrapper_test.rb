require 'test_helper'

describe "RecipeApiWrapper" do
  describe "initialize" do
    it "Takes a recipe_hash as an argument" do
      recipe_hash = {
        "label" => "label",
        "image"  =>"image is here",
        "calories" => "calories",
        "uri"  => "http://www.edamam.com/ontologies/edamam.owl#recipe_d611b46c76dfb67266d7560e7b199c51",
        "diet_labels"  => ["one", "two"],
        "health_labels"  => ["one", "two"],
        "ingredients"  =>  {hash: "ingridients", more: "someline"},
      }
      r = RecipeApiWrapper.new(recipe_hash)

      r.label.must_equal "label"
    end
    it " argument error if no arguments is presented" do
      proc { RecipeApiWrapper.new }.must_raise ArgumentError
    end
  end

  describe "self.search" do
    it "can search for recipes" do
      VCR.use_cassette("recipes") do
        RecipeApiWrapper.search("apple", 0)
      end
    end
    it "failed to search without arguments" do
      VCR.use_cassette("recipes") do
        proc {  RecipeApiWrapper.search()
        }.must_raise ArgumentError
      end
    end
    it "return 12 recepies" do
      VCR.use_cassette("recipes") do
        result = RecipeApiWrapper.search("apple", 0)
        result.length.must_equal 12
      end
    end
  end

  describe "self.all" do
    it "failed to search without arguments" do
      VCR.use_cassette("recipes_all") do
        proc {  RecipeApiWrapper.all()
        }.must_raise ArgumentError
      end
    end
    it "return max 300 recepies" do
      VCR.use_cassette("recipes_all") do
        result = RecipeApiWrapper.search("apple", 0)
        result.length.must_equal 300
      end
    end

  end


  describe "self.find_recipe(uri)" do
    it "find one recipe" do
      VCR.use_cassette("recipe") do
        recipe = RecipeApiWrapper.find_recipe("d38d01540acb03fba45e4ac2660627ac")
        recipe.name.must_equal "Sunday Supper: Jerk Half-Chickens"
        recipe.must_be_kind_of RecipeApiWrapper
      end
    end
    it "raise error if no uri given" do
      VCR.use_cassette("recipe") do
        proc { recipe = RecipeApiWrapper.find_recipe()
          recipe.must_be_kind_of RecipeApiWrapper}.must_raise ArgumentError
        end
      end
    end


    describe "self.health_options" do
      it "return string if at least one options are given" do
        vegan,kosher, vegetarian, paleo = "vegan","kosher", "vegetarian", "paleo"
        RecipeApiWrapper.health_options(vegan, kosher, vegetarian, paleo).must_be_kind_of String
      end
      it "return empty string if all arguments are nil" do
        vegan,kosher, vegetarian, paleo = nil,nil,nil,nil
        RecipeApiWrapper.health_options(vegan, kosher, vegetarian, paleo).must_equal ""
      end
    end
  end
