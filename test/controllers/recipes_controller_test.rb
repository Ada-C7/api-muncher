require "test_helper"

describe RecipesController do

     before do
          VCR.insert_cassette 'edamam'
     end

     after do
          VCR.eject_cassette 'edamam'
     end

     it "shows list of recipes" do
               get recipes_path
               must_respond_with :success
     end

     it "shows a recipe if id is valid" do
               get recipe_path('_996fa32937d4f038df2d87a4abda1570')
               must_respond_with :success
     end

     it "does not show a recipe if id is not valid" do
               get recipe_path('is not valid')
               flash[:error].must_include "We haven't that chocolate recipe on file."
               must_redirect_to root_path
     end
end
