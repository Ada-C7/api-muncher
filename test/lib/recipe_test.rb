require 'test_helper'
require 'recipe'

describe Recipe do
  describe 'initialize' do
    let(:recipe1) { Recipe.new(
      'Rotten Strawberry Stew',
      'https://www.rottenstrawberries.com/image.jpg',
      'http://www.edamam.com/uri_stuff',
      'http://www.edamam.com/recipe',
      ['strawberries', 'water'],
      ['fat free']
      )
    }

    it 'recipe must have all attributes' do
      recipe1.label.must_equal 'Rotten Strawberry Stew'
      recipe1.image.must_equal 'https://www.rottenstrawberries.com/image.jpg'
      recipe1.uri.must_equal 'http://www.edamam.com/uri_stuff'
      recipe1.url.must_equal 'http://www.edamam.com/recipe'
      recipe1.ingredients.must_equal ['strawberries', 'water']
      recipe1.diet.must_equal ['fat free']
    end

    it 'recipe can not be made without all attributes' do
      proc { Recipe.new }.must_raise ArgumentError
    end
  end

  describe 'self.search' do
    it 'valid search results returns an array' do
      VCR.use_cassette('recipes') do
        recipes = Recipe.search('arugula', 1)
        recipes.class.must_equal Array
      end
    end

    it 'invalid search term returns empty array' do
      VCR.use_cassette('recipes') do
        recipes = Recipe.search('mksdjfhgskdghlsjdffs', 1)
        recipes.must_equal []
      end
    end
  end

  describe 'self.show_recipe' do
    it 'valid recipe returns Recipe object' do

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
        recipe.class.must_equal Recipe
        recipe.label.must_equal 'Picadillo Tacos'
        recipe.url.must_equal 'http://honestcooking.com/picadillo-tacos-recipe/'
        recipe.ingredients.must_equal ingredients
      end
    end

    it 'invalid uri returns nil' do
      VCR.use_cassette('recipes') do
        recipe = Recipe.show_recipe('recipe_gfljkhfsgjlhksfgkjhdsfgfghf')
        recipe.must_equal nil
      end
    end

    describe 'from_hash' do
      it 'returns a Recipe object' do
        hash = {
          :label => 'Trail Mix',
          :image => 'https://..',
          :uri => '_e666',
          :url => 'https://..',
          :ingredientLines => ['almonds', 'chocolate'],
          :dietLabels => ['yummy', 'best food ever']
        }
        recipe = Recipe.from_hash(hash)
        recipe.class.must_equal Recipe
      end

      it 'returns a Recipe object with missing key' do
        hash = {
          :label => 'Trail Mix',
          :image => 'https://..',
          :uri => '_e666',
          :dietLabels => ['yummy', 'best food ever']
        }
        recipe = Recipe.from_hash(hash)
        recipe.class.must_equal Recipe
      end
    end
  end
end
