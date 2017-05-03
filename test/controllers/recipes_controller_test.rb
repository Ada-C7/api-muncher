require 'test_helper'

describe RecipesController do

  before do
    VCR.insert_cassette("recipe")
  end
  after do
    VCR.eject_cassette("recipe")
  end


end
