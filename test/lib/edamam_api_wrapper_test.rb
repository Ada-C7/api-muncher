require 'test_helper'

describe EdamamApiWrapper do

  describe "self.get_recipes" do
    it "can get 10 recipes given a search term" do
      VCR.use_cassette("recipes") do
        search_term = "chicken"
        recipes = EdamamApiWrapper.get_recipes(search_term, 1)

        recipes.count.must_equal 10
        recipes.must_be_instance_of Array
        recipes.each { |recipe| recipe.must_be_instance_of Recipe }
      end
    end

    it "will return an empty array if given an empty string search term" do
      VCR.use_cassette("recipes") do
        search_term = ""
        recipes = EdamamApiWrapper.get_recipes(search_term, 1)

        recipes.must_equal []
      end
    end
  end

  describe "self.page_to_pages" do
    it "returns indices [0,10] for page 1" do
      from, to = EdamamApiWrapper.page_to_pages(1)

      from.must_equal 0
      to.must_equal 10
    end

    it "returns indices [10,20] for page 2" do
      from, to = EdamamApiWrapper.page_to_pages(2)

      from.must_equal 10
      to.must_equal 20
    end

    it "must not duplicate recipes across pages" do
      recipe_titles = []

      VCR.use_cassette("recipes") do
        search_term = "chicken"
        recipes = EdamamApiWrapper.get_recipes(search_term, 1)
        recipes.each { |recipe| recipe_titles << recipe.title }

        recipes = EdamamApiWrapper.get_recipes(search_term, 2)
        recipes.each { |recipe| recipe_titles << recipe.title }
      end

      recipe_titles.count.must_equal 20
      recipe_titles.uniq.count.must_equal 20
    end
  end
end
