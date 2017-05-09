require "test_helper"

describe RecipesController do
    describe "index" do
        it "should get list of recipes" do
            VCR.use_cassette("recipes") do
                get recipes_path
                must_respond_with :success
            end
        end
    end

    describe "show" do
        it "should show an individual recipe" do
            VCR.use_cassette("recipe") do
                recipe = EdamamApiWrapper.showRecipe("http://www.edamam.com/ontologies/edamam.owl%23recipe_27462b90519cb022b134a186afbd9000")

                get recipe_path(:name => recipe.name, :uri => recipe.uri)
                must_respond_with :success
            end
        end

    end
end
