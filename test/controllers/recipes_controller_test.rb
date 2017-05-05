require "test_helper"

describe RecipesController do
  before do
    VCR.insert_cassette("recipe")
  end

  after do
    VCR.eject_cassette("recipe")
  end

  it "Should get index" do
    get recipes_path("chicken")
    must_respond_with :success
  end

  it "Should get show" do
    get recipe_path(label:'chicken', uri:"https://api.edamam.com/search?r=http://www.edamam.com/ontologies/edamam.owl%23recipe_637913ec61d9da69eb451818c3293df2")
    # recipe = SearchApiWrapper.showRecipe("https://api.edamam.com/search?r=http://www.edamam.com/ontologies/edamam.owl%23recipe_637913ec61d9da69eb451818c3293df2")
    must_respond_with :success
  end

  it "should show flash message when there is no match of search item " do
      get recipes_path("123")
      flash[:error].must_equal "Sorry, there is no match"
  end

end
