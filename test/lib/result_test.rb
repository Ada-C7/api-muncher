require 'test_helper'

describe Result do

  before do
    @test_recipe_label = "Potato Toes"
    @test_recipe_uri = "http://www.edamam.com/ontologies/edamam.owl%23recipe_637913ec61d9da69eb451818c3293df2"
    @test_recipe_image = "image"
  end

  it "initializes" do
    initiation = Result.new(@test_recipe_label, @test_recipe_uri, @test_recipe_image)
    initiation.recipe_label.must_equal "Potato Toes"
  end

end
