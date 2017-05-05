class Recipe

  class RecipeException < StandardError
  end

  BASE_URL = "https://api.edamam.com/search"

  attr_reader :name, :image, :id, :original_url, :ingredients, :health_labels

  def initialize(recipe_params)
    @name = recipe_params[:name]
    @image = recipe_params[:image]
    @id = recipe_params[:id]
    @original_url = recipe_params[:original_url]
    @ingredients = recipe_params[:ingredients]
    @health_labels = recipe_params[:health_labels]
  end

  def self.search(item)
    query_params = {
      "app_id" => ENV["EDAMAM_API_APP_ID"],
      "app_key" => ENV["EDAMAM_API_APP_KEY"],
      "q" => item
    }

    recipes = HTTParty.get(BASE_URL, query: query_params).parsed_response["hits"]

    recipe_array =[]

    recipes.each do |recipe|
      id = recipe["recipe"]["uri"].split("_").last

      recipe_params = {name: recipe["recipe"]["label"], image: recipe["recipe"]["image"], id: id }

        recipe_array << Recipe.new(recipe_params)
      end
    return recipe_array
  end


  def self.getRecipe(id)
    query_params = {
      "app_id" => ENV["EDAMAM_API_APP_ID"],
      "app_key" => ENV["EDAMAM_API_APP_KEY"],
      "q" => id
    }

    recipe = HTTParty.get(BASE_URL, query: query_params).parsed_response["hits"][0]

    id = recipe["recipe"]["uri"].split("_").last

    recipe_params = {name: recipe["recipe"]["label"], image: recipe["recipe"]["image"], id: id,
      original_url: recipe["recipe"]["url"], ingredients: recipe["recipe"]["ingredientLines"], health_labels: recipe["recipe"]["healthLabels"]}


    return Recipe.new(recipe_params)


        # if response["channel"]
        #   return Channel.new(response["channel"]["name"], response["channel"]["id"])
        # else
        #   return nil
        # end
  end


end









    #return recipe_name = response.parsed_response["hits"][0]["recipe"]["label"]
    #recipe_image = response.parsed_response["hits"][0]["recipe"]["image"]
