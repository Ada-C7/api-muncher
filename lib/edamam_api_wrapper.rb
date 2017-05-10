require 'httparty'

class EdamamApiWrapper
    BASE_URL = "https://api.edamam.com/search?"
    APP_ID = ENV["RECIPE_APP_ID"]
    APP_KEY = ENV["RECIPE_KEY"]

    def self.getRecipes(name)
        search_item = name
        url = BASE_URL + "q=#{search_item}" + "&app_id=#{APP_ID}&app_key=#{APP_KEY}"
        response = HTTParty.get(url).parsed_response["hits"]

        #create an array to store the recipes in
        recipes = []

        response.each do |recipe|
            name = recipe["recipe"]["label"]
            new_recipe = Recipe.new(name)
            recipes << new_recipe
        end

        return recipes
    end
end
