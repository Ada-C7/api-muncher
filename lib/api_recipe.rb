BASE_URL = "https://api.edamam.com/search"
app_id=#{ENV["EDAMAM_APP_ID"]}&app_key=#{ENV["EDAMAM_APP_KEYS"]}&health=vegan"

class ApiRecipe
  class ApiRecipeException < StandardError
  end

  def self.find(query)
    query_params = {
      "app_id" => ENV["EDAMAM_APP_ID"],
      "app_key" => ENV["EDAMAM_APP_KEYS"],
      "q" => query,
      "health" => "vegan"
    }

    url = "#{BASE_URL}?"
    response = HTTParty.get(url, query: query_params)
    if response["ok"]
      puts "Everything went swell"
    else
      puts "This is wrong"
      # raise ApiRecipeException.new(response["error"])
    end
    # do something with the response
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
