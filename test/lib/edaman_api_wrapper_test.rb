require "test_helper"

describe EdamamApiWrapper do
  it "should get index" do
    VCR.use_cassette("edamam") do
    recipes = EdamamApiWrapper.listRecipes("chicken")
    recipes.must_be_instance_of Array
   end
  end

  # it "should get show" do
  #   get homepages_show_url
  #   value(response).must_be :success?
  # end

end
