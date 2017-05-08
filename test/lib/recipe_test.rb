require 'test_helper'
require 'recipe'

describe Recipe do
  describe 'initialize' do
    let(:recipe1) { Recipe.new(
      'Rotten Strawberry Stew',
      'https://www.rottenstrawberries.com/image.jpg',
      'http://www.edamam.com/uri_stuff',
      )
    }

    it 'recipe must have all attributes' do
      recipe1.label.must_equal 'Rotten Strawberry Stew'
      recipe1.image.must_equal 'https://www.rottenstrawberries.com/image.jpg'
      recipe1.uri.must_equal 'http://www.edamam.com/uri_stuff'
    end

    it 'recipe can not be made without all attributes' do
      proc { Recipe.new }.must_raise ArgumentError
    end
  end

  describe 'self.search' do
    it 'valid search results returns an array' do
      VCR.use_cassette('recipes') do
        recipes = Recipe.search('arugula')
        recipes.class.must_equal Array
      end
    end

    it 'invalid search term returns empty array' do
      VCR.use_cassette('recipes') do
        recipes = Recipe.search('mksdjfhgskdghlsjdffs')
        recipes.must_equal []
      end
    end
  end

  describe 'self.show_recipe' do
    it 'valid recipe returns hash' do

      ingredients = [
        "1 lb ground pork",
        "¼ cup + 2 tbsp golden raisins",
        "¼ cup pimento olives, diced",
        "½ sweet red pepper, diced",
        "¼ medium onion, diced",
        "1 tsp agave",
        "¼ cup of water",
        "8 hard tacos shells",
        "Salt and pepper to taste"
      ]

      VCR.use_cassette('recipes') do
        recipe = Recipe.show_recipe('recipe_5e7b278b580ccea8ab485607dff5416a')
        recipe.class.must_equal Hash
        recipe[:label].must_equal 'Picadillo Tacos'
        recipe[:url].must_equal 'http://honestcooking.com/picadillo-tacos-recipe/'
        recipe[:ingredients].must_equal ingredients
        recipe[:diet].must_equal []
      end
    end

    it 'invalid uri returns an empty hash' do
      VCR.use_cassette('recipes') do
        recipe = Recipe.show_recipe('recipe_gfljkhfsgjlhksfgkjhdsfgfghf')
        recipe.must_equal []
      end
    end

    # Only point from a look at your test code is that to do better
    # with the recipe tests, you should verify the attributes of the
    #  recipe retrieved from Recipe.show_recipe, instead of just
    #checking that you get back a Hash.

  end
end
