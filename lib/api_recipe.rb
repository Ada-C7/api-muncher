
class ApiRecipe
  BASE_URL = "https://api.edamam.com/"
  attr_reader :label, :uri, :image, :url, :source

  class ApiRecipeException < StandardError
  end

  def initialize(hash_params)
    @label = hash_params[:label]
    @uri = hash_params[:uri]
    @image = hash_params[:image]
    @url = hash_params[:url]
    @source = hash_params[:source]
  end

  def self.find(query, from)
    query_params = {
      "q" => query,
      "app_id" => ENV["EDAMAM_APP_ID"],
      "app_key" => ENV["EDAMAM_APP_KEYS"],
      "health" => "vegan",
      "from" => from,
      "to" => (from.to_i + 10)
    }

    url = "#{BASE_URL}search?"
    response = HTTParty.get(url, query: query_params).parsed_response
    if response["hits"]
      recipes = response["hits"].map do |recipe|
        self.new(label: recipe["recipe"]["label"], uri: recipe["recipe"]["uri"], image: recipe["recipe"]["image"],
        url: recipe["recipe"]["url"], source: recipe["recipe"]["source"])
      end

      return recipes
    else
      raise ApiRecipeException.new(response["error"])
    end
  end

  # def self.all
  #   url = "#{BASE_URL}?app_id=#{ENV["EDAMAM_APP_ID"]}&app_key=#{ENV["EDAMAM_APP_KEYS"]}&health=vegan"
  #   response = HTTParty.get(url).parsed_response
  #   if response["ok"]
  #     recipe_list = response.map do |recipe|
  #       self.new(recipe)
  #     end
  #
  #     return recipe_list
  #   else
  #     raise ApiRecipeException.new(response["error"])
  #   end
  # end

end
