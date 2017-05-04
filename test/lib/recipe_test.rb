require 'test_helper'

describe Recipe do
  describe 'initialize' do
    it 'recipe is created with 5 attributes' do
      # Attributes: label, image, url, ingredient list,
      # and diet label
      recipe = Recipe.new(
      'Rotten Strawberry Stew',
      'https://www.rottenstrawberriesmakemesad.com/image.jpg',
      'https://www.gettheserottenstrawberriesoutoutofmyfridge.com/terriblerecipe',
      ['rotten strawberries', 'sadness', 'shame'],
      ['Do not eat', 'why are you eating these?']
      )

      recipe.label.must_equal 'Rotten Strawberry Stew'
      recipe.image.must_equal 'https://www.rottenstrawberriesmakemesad.com/image.jpg'
      recipe.url.must_equal 'https://www.gettheserottenstrawberriesoutoutofmyfridge.com/terriblerecipe'
      recipe.ingredient_lines.must_equal ['rotten strawberries', 'sadness', 'shame']
      recipe.diet_labels.must_equal ['Do not eat', 'why are you eating these?']
    end
    # Think about arrays vs. strings

    it 'recipe can be created with empty string attribute' do
      recipe = Recipe.new(
      'Rotten Strawberry Stew',
      '',
      'https://www.gettheserottenstrawberriesoutoutofmyfridge.com/terriblerecipe',
      ['rotten strawberries', 'sadness', 'shame'],
      ['Do not eat', 'why are you eating these?']
      )

      recipe.label.must_equal 'Rotten Strawberry Stew'
      recipe.image.must_equal ''
      recipe.url.must_equal 'https://www.gettheserottenstrawberriesoutoutofmyfridge.com/terriblerecipe'
      recipe.ingredient_lines.must_equal ['rotten strawberries', 'sadness', 'shame']
      recipe.diet_labels.must_equal ['Do not eat', 'why are you eating these?']
    end

    it 'recipe is created with an empty array' do
      # Attributes: label, image, url, ingredient list,
      # and diet label
      recipe = Recipe.new(
      'Rotten Strawberry Stew',
      'https://www.rottenstrawberriesmakemesad.com/image.jpg',
      'https://www.gettheserottenstrawberriesoutoutofmyfridge.com/terriblerecipe',
      ['rotten strawberries', 'sadness', 'shame'],
      []
      )

      recipe.label.must_equal 'Rotten Strawberry Stew'
      recipe.image.must_equal 'https://www.rottenstrawberriesmakemesad.com/image.jpg'
      recipe.url.must_equal 'https://www.gettheserottenstrawberriesoutoutofmyfridge.com/terriblerecipe'
      recipe.ingredient_lines.must_equal ['rotten strawberries', 'sadness', 'shame']
      recipe.diet_labels.must_equal []
    end

    it 'recipe is not created without all 5 attributes' do
      proc { Recipe.new }.must_raise ArgumentError
    end

  end

  describe 'self.search' do

  end
end


# it 'takes a name' do
#   name = 'test channel'
#   sc = SlackChannel.new(name)
#   sc.name.must_equal name
# end

# VCR.use_cassette('channels') do
#   channel = SlackChannel.new('queues_api_testing')
#   channel.send('I love you everything burrito.')
# end
