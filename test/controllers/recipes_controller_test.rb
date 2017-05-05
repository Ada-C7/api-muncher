require 'test_helper'

describe RecipesController do
  describe 'search' do
    it 'successful search returns many results' do
      skip
      VCR.use_cassette('recipes') do
        results = Recipe.search('arugula')
        results.length.must_be :>, 0

        get search_recipes_path
      end
    end
  end
end

# VCR.use_cassette('channels') do
#   channel = SlackChannel.new('queues_api_testing')
#   channel.send('I love you everything burrito.')
# end
