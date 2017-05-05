require 'test_helper'
require 'recipe'

describe Recipe do
  describe 'initialize' do
      let(:recipe) { Recipe.new(
        'Rotten Strawberry Stew',
        'https://www.rottenstrawberries.com/image.jpg',
        'http://www.edamam.com/uri_stuff',
        )
      }

    it 'recipe must have all attributes' do
      recipe.label.must_equal 'Rotten Strawberry Stew'
      recipe.image.must_equal 'https://www.rottenstrawberries.com/image.jpg'
      recipe.uri.must_equal 'http://www.edamam.com/uri_stuff'
    end
    # Think about arrays vs. strings

    it 'recipe can have an empty string attribute' do
      recipe.instance_variable_set(:@image, '')

      recipe.image.must_equal ''
    end

    it 'recipe can not be made without all attributes' do
      proc { Recipe.new }.must_raise ArgumentError
    end

  end

  describe 'self.search' do
    it 'search results returns an array' do
      VCR.use_cassette('recipes') do
        recipes = Recipe.search('arugula')
        recipes.class.must_equal Array
      end
    end
    #NOTE: Fixed typo for next commit.

    it 'search term without any results returns an empty array' do
    end

    it 'empty search term causes a redirect' do
    end
  end
end
