class Recipe

  class RecipeException < StandardError
  end

  BASE_URL = "https://api.edamam.com/search"

  attr_reader :name, :image, :id, :original_url

  def initialize(recipe_params)
    @name = recipe_params[:name]
    @image = recipe_params[:image]
    @id = recipe_params[:id]
    @original_url = recipe_params[:original_url]
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
      
      recipe_params = {name: recipe["recipe"]["label"], image: recipe["recipe"]["image"], id: id,
        original_url: recipe["recipe"]["url"]}

        recipe_array << Recipe.new(recipe_params)
      end
      return recipe_array
    end


    def self.getRecipe(name)

      query_params = {
        "app_id" => ENV["EDAMAM_API_APP_ID"],
        "app_key" => ENV["EDAMAM_API_APP_KEY"],
        "q" => name
      }

      recipe = HTTParty.get(BASE_URL, query: query_params).parsed_response["hits"][0]

      id = recipe["recipe"]["uri"].split("_").last

      recipe_params = {name: recipe["recipe"]["label"], image: recipe["recipe"]["image"], id: id,
        original_url: recipe["recipe"]["url"]}

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
