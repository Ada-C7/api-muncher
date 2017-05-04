require "test_helper"

describe IngredientsController do
  it "should get show" do
    get ingredients_show_url
    value(response).must_be :success?
  end

end
