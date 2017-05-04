require 'test_helper'

describe Recipe do
  describe "initialize" do
    it "take params and they are attribute accessors" do
      params = {
        label: "chicken",
        image: "Longstring......jaja",
        url: "Anotherlongstring",
        calories: 700,
        dietLabels: "More Strings",
        healthLabels: "Guees what?",
        ingredients: "Yes! More strings"
      }
      q = Recipe.new(params)
      q.label.must_equal "chicken"
      q.ingredients.must_equal "Yes! More strings"
    end

    it "Do not create a new instance without params" do
      proc {
        Recipe.new
      }.must_raise ArgumentError
    end

    it "Let create a new instance with a least one param" do
      q = Recipe.new(label: "Rico Pollo")
      q.label.must_equal "Rico Pollo"
      q.image.must_equal nil
    end
  end

  describe "self.search" do
    it "Returns a list of recipes based on a word" do
      VCR.use_cassette('recipes') do
        r = Recipe.search("potato")
        r.nil?.must_equal false
      end

    end
  end
end
