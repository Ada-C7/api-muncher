require 'test_helper'

describe RecipesController do
  before do
    VCR.insert_cassette("edamam")
  end

  after do
    VCR.eject_cassette("edamam")
  end

  describe '#index' do
    it "should get index" do
      get recipes_path
      must_respond_with :success
    end
  end

  describe '#show' do
    it 'should get show' do
      get recipe_path(name: "Spicy Taiwanese Chicken and Celery", uri: "https://www.edamam.com/ontologies/edamam.owl%23recipe_9f599ab29949e1a7989a06c227f8ba70")
      must_respond_with :success
    end
  end
end
