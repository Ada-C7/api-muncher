require 'test_helper'

describe Recipe do
  it "requires 3 arguments to initialize" do
    proc {
      Recipe.new
    }.must_raise ArgumentError

    proc {
      Recipe.new("label")
    }.must_raise ArgumentError

    proc {
      Recipe.new("label", "image")
    }.must_raise ArgumentError
  end

  it "Creates a Recipe instance" do
    recipe = Recipe.new("Simply Carrots", "www.image.com", "123")

    recipe.class.must_equal Recipe
    recipe.name.must_equal "Simply Carrots"
    recipe.image_url.must_equal "www.image.com"
    recipe.id.must_equal "123"
  end

  it "Creates a Recipe with optional params" do
    recipe = Recipe.new("label", "image", "uri", { url: "www.fake_url.com"})
    recipe.url.must_equal "www.fake_url.com"
  end

  it "Creates a Recipe with all optional params" do
    recipe = Recipe.new("label", "image", "uri", { url: "www.fake_url.com", ingredientLines: "carrot", digest: "salt"})
    recipe.url.must_equal "www.fake_url.com"
    recipe.ingredients.must_equal "carrot"
    recipe.nutritions.must_equal "salt"
  end

  it "Has the accessor methods" do
    recipe = Recipe.new("label", "image", "uri", { url: "www.fake_url.com", ingredientLines: "carrot", digest: "salt"})
    recipe.must_respond_to "name"
    recipe.must_respond_to "image_url"
    recipe.must_respond_to "id"
    recipe.must_respond_to "url"
    recipe.must_respond_to "ingredients"
    recipe.must_respond_to "nutritions"
  end
end
