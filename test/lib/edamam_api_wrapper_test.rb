require 'test_helper'

describe EdamamApiWrapper do
    describe "self.getRecipes" do
        it "can get a list of recipes" do
            VCR.use_cassette("edamam")do
                recipes = EdamamApiWrapper.getRecipes("leek")
                recipes.must_be_instance_of Array
                recipes.each do |recipe|
                    recipe.must_be_instance_of Recipe
                end
            end
        end
        it "Will return an empty array for bad search item" do
            VCR.use_cassette("edamam") do
                recipes = EdamamApiWrapper.getRecipes("!")
                recipes.must_equal []
            end
        end
    end


    describe "self.showRecipe" do
        it "gets a recipe" do
            VCR.use_cassette("edamam") do
                recipe = EdamamApiWrapper.showRecipe("http://www.edamam.com/ontologies/edamam.owl%23recipe_27462b90519cb022b134a186afbd9000")
                recipe.name.must_equal "Plain and Simple Kale"
            end
        end

        # it "returns false for an invalid recipe" do
        #     VCR.use_cassette("edamam") do
        #         recipe = EdamamApiWrapper.showRecipe("")
        #         must_be nil
        #     end
        # end

    end
end
