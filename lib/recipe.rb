class Recipe

  class RecipeException < StandardError
  end

  BASE_URL = "https://api.edamam.com/search"

  attr_reader :name, :image, :id, :original_url, :ingredients, :health_labels, :diet_labels, :calories, :yield, :calories_per_serving

  def initialize(recipe_params)
    @name = recipe_params[:name]
    @image = recipe_params[:image]
    @id = recipe_params[:id]
    @original_url = recipe_params[:original_url]
    @ingredients = recipe_params[:ingredients]
    @health_labels = recipe_params[:health_labels]
    @diet_labels = recipe_params[:diet_labels]
    @calories = recipe_params[:calories]
    @yield = recipe_params[:yield]
    if @calories && @yield && @yield != 0
      @calories_per_serving = @calories/@yield
    end
  end

  def self.search(item, from, to)
    query_params = {
      "app_id" => ENV["EDAMAM_API_APP_ID"],
      "app_key" => ENV["EDAMAM_API_APP_KEY"],
      "q" => item,
      "from" => from,
      "to" => to
    }

    recipes = HTTParty.get(BASE_URL, query: query_params).parsed_response

    total_count = recipes["count"]

    recipe_array =[]

    recipes["hits"].each do |recipe|
      id = recipe["recipe"]["uri"].split("_").last

      recipe_params = {name: recipe["recipe"]["label"], image: recipe["recipe"]["image"], id: id }

        recipe_array << Recipe.new(recipe_params)
      end
    return recipe_array, total_count
  end


  def self.getRecipe(id)
    query_params = {
      "app_id" => ENV["EDAMAM_API_APP_ID"],
      "app_key" => ENV["EDAMAM_API_APP_KEY"],
      "q" => id
    }

    recipe = HTTParty.get(BASE_URL, query: query_params).parsed_response["hits"][0]

    id = recipe["recipe"]["uri"].split("_").last

    recipe_params = {name: recipe["recipe"]["label"],
      image: recipe["recipe"]["image"],
      id: id,
      original_url: recipe["recipe"]["url"],
      ingredients: recipe["recipe"]["ingredientLines"], health_labels: recipe["recipe"]["healthLabels"], diet_labels: recipe["recipe"]["dietLabels"],
      calories: recipe["recipe"]["calories"],
      yield: recipe["recipe"]["yield"]
      }


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
