require 'httparty'

class EdamamApiWrapper
    APP_ID = ENV["RECIPE_APP_ID"]
    APP_KEY = ENV["RECIPE_KEY"]
    BASE_URL = "https://api.edamam.com/search?"

    def self.getRecipes(search_item)
        url = BASE_URL + "q=#{search_item}" + "&app_id=#{APP_ID}&app_key=#{APP_KEY}" + "&from =0&to=100"
        response = HTTParty.get(url).parsed_response["hits"]

        #create an array to store the recipes in
        recipes = []
        if response
            response.each do |recipe|
                name = recipe["recipe"]["label"]
                image = recipe["recipe"]["image"]
                uri = recipe["recipe"]["uri"]
                new_recipe = Recipe.new(name, image, uri)

                recipes << new_recipe
            end
        end

        return recipes
    end


    def self.showRecipe(uri)
        url = BASE_URL + "r=#{uri}"
        recipe = HTTParty.get(url).parsed_response
        name = recipe[0]["label"]
        image = recipe[0]["image"]
        uri = recipe[0]["uri"]
        link = recipe[0]["url"]
        ingredients = recipe[0]["ingredientLines"]
        health_labels = recipe[0]["healthLabels"]
        recipe = Recipe.new(name, image, uri, link: link, ingredients: ingredients, health_labels: health_labels )
        return recipe
    end
end
