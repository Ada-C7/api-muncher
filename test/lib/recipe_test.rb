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
      VCR.use_cassette('recipes') do
        recipe = Recipe.show_recipe('recipe_5e7b278b580ccea8ab485607dff5416a')
        recipe.class.must_equal Hash
      end
    end

    it 'invalid uri returns an empty hash' do
      VCR.use_cassette('recipes') do
        recipe = Recipe.show_recipe('recipe_gfljkhfsgjlhksfgkjhdsfgfghf')
        recipe.must_equal []
      end
    end
  end
end
