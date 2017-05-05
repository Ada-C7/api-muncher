require 'test_helper'

describe Recipe do
  describe 'initialize' do
    before do
      @recipe = Recipe.new(
      'Rotten Strawberry Stew',
      'https://www.rottenstrawberries.com/image.jpg',
      'https://www.rottenstrawberries.com/terriblerecipe',
      ['rotten strawberries', 'sadness', 'shame'],
      ['Do not eat', 'why are you eating these?']
      )
    end

    it 'recipe must have all 5 attributes' do
      @recipe.label.must_equal 'Rotten Strawberry Stew'
      @recipe.image.must_equal 'https://www.rottenstrawberries.com/image.jpg'
      @recipe.url.must_equal 'https://www.rottenstrawberries.com/terriblerecipe'
      @recipe.ingredient_lines.must_equal ['rotten strawberries', 'sadness', 'shame']
      @recipe.diet_labels.must_equal ['Do not eat', 'why are you eating these?']
    end
    # Think about arrays vs. strings

    it 'recipe can have an empty string attribute' do
      @recipe.instance_variable_set(:@image, '')

      @recipe.label.must_equal 'Rotten Strawberry Stew'
      @recipe.image.must_equal ''
      @recipe.url.must_equal 'https://www.rottenstrawberries.com/terriblerecipe'
      @recipe.ingredient_lines.must_equal ['rotten strawberries', 'sadness', 'shame']
      @recipe.diet_labels.must_equal ['Do not eat', 'why are you eating these?']
    end

    it 'recipe can have an empty array attribute' do
      @recipe.instance_variable_set(:@diet_labels, [])

      @recipe.label.must_equal 'Rotten Strawberry Stew'
      @recipe.image.must_equal 'https://www.rottenstrawberries.com/image.jpg'
      @recipe.url.must_equal 'https://www.rottenstrawberries.com/terriblerecipe'
      @recipe.ingredient_lines.must_equal ['rotten strawberries', 'sadness', 'shame']
      @recipe.diet_labels.must_equal []
    end

    it 'recipe must have 5 attributes' do
      proc { Recipe.new }.must_raise ArgumentError
    end

  end

  describe 'self.search' do
    it 'search results returns an array' do
      VCR.use_cassette('recipes') do
        recipe = Recipe.search('arugula')
        recipe.class.must_equal Array
      end
    end
  end
end

# it 'can send a message to a real channel' do
#   VCR.use_cassette('channels') do
#     channel = SlackChannel.new('queues_api_testing')
#     channel.send('I love you everything burrito.')
#   end
# end
