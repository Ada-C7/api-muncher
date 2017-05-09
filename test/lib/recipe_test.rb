require 'test_helper'


describe "Recipe" do
  before do
    VCR.insert_cassette("edamam")
  end

  after do
    VCR.eject_cassette("edamam")
  end

  it "requires a hash to initialize" do
    recipe_hash = {label: "bread", image: "image", url: "string", uri: "string", servings: "string", diet_labels: "string", health_labels: "string", ingredients: "ingredients", id: "string"}
    recipe = Recipe.new(recipe_hash)
    recipe.must_be_instance_of Recipe
    #no hash
    proc {
      Recipe.new
    }.must_raise ArgumentError

    #one argument that isn't a hash
    proc {
      Recipe.new "recipe"
    }.must_raise TypeError
  end



  it "has the Accessor methods" do
    recipe_hash = {label: "bread", image: "image", url: "string", uri: "string", servings: "string", diet_labels: "string", health_labels: "string", ingredients: "ingredients", id: "string"}
    recipe = Recipe.new(recipe_hash)
    recipe.label.must_equal "bread"
    recipe.image.must_equal "image"
  end


end
