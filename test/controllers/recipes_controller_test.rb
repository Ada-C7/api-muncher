require "test_helper"

describe RecipesController do
  let(:recipe) { recipes :one }

  it "gets index" do
    get recipes_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_recipe_url
    value(response).must_be :success?
  end

  it "creates recipe" do
    expect {
      post recipes_url, params: { recipe: {  } }
    }.must_change "Recipe.count"

    must_redirect_to recipe_path(Recipe.last)
  end

  it "shows recipe" do
    get recipe_url(recipe)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_recipe_url(recipe)
    value(response).must_be :success?
  end

  it "updates recipe" do
    patch recipe_url(recipe), params: { recipe: {  } }
    must_redirect_to recipe_path(recipe)
  end

  it "destroys recipe" do
    expect {
      delete recipe_url(recipe)
    }.must_change "Recipe.count", -1

    must_redirect_to recipes_path
  end
end
