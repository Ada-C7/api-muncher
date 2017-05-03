class Recipe

  class RecipeException < StandardError
  end

  BASE_URL = "https://api.edamam.com/search"

  attr_reader :name, :image, :original_uri

  def initialize(recipe_params)
    @name = recipe_params[:name]
    @image = recipe_params[:image]
    @original_uri = recipe_params[:original_uri]
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
      recipe_params = {name: recipe["recipe"]["label"], image: recipe["recipe"]["image"], original_uri: recipe["recipe"]["uri"] }

      recipe_array << Recipe.new(recipe_params)
    end
    return recipe_array
  end


  def self.getRecipe(uri)


    query_params = {
      "app_id" => ENV["EDAMAM_API_APP_ID"],
      "app_key" => ENV["EDAMAM_API_APP_KEY"],
      "r" => uri
    }

    recipe = HTTParty.get(BASE_URL, query: query_params).parsed_response
    return recipe["label"]

    # if response["channel"]
    #   return Channel.new(response["channel"]["name"], response["channel"]["id"])
    # else
    #   return nil
    # end
  end


end









#return recipe_name = response.parsed_response["hits"][0]["recipe"]["label"]
#recipe_image = response.parsed_response["hits"][0]["recipe"]["image"]
