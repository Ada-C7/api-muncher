require 'test_helper'
require 'pry'
describe EdamamApiWrapper do
  describe "initialize" do
    it "Returns object" do
      recipe =
      {
        "label" => "beef chow mein",
        "image" => "http://www.google.com",
        "uri" => "http://www.fb.com",
        "ingredientLines" => "big string",
        "totalNutrients"=> "absolutely none"
      }

      r = EdamamApiWrapper.new(recipe)
      r.name.must_equal recipe["label"]
      r.url.must_equal recipe["uri"]
      r.image.must_equal recipe["image"]
      r.ingredients.must_equal recipe["ingredientLines"]
      r.must_be_kind_of EdamamApiWrapper
    end


    it "raises argument error without parameters" do
      proc {
        EdamamApiWrapper.new
      }.must_raise ArgumentError
    end
  end


  describe "all" do
    it "Returns an array of food recipes where each recipe has a name and url" do
      VCR.use_cassette("food_fun") do
        food_fun = EdamamApiWrapper::all("coconut")
        food_fun.must_be_kind_of Array

        food_fun.all? do |ff|
          ff.must_be_kind_of EdamamApiWrapper
          ff.name.wont_be_nil
          ff.url.wont_be_nil
        end
      end
    end

    it "returns an empty array if no recipes found" do
      VCR.use_cassette("food_fun") do
        food_fun = EdamamApiWrapper::all("rainbow_llama_sprinkles")
        food_fun.must_be_kind_of Array
        food_fun.must_be_empty
      end
    end
  end
end
