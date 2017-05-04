require 'test_helper'

describe Recipe do
  let(:recipe) { Recipe.new }

  it 'must be valid' do
    value(recipe).must_be :valid?
  end

  describe 'index' do
    it 'sends search' do
      
    end
  end
end
