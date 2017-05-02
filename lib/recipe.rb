require 'httparty'

class Recipe
  BASE_URL = "https://api.edamam.com/search?"
  def initialize(name)
    @name = name
  end
  # def recipe_search
  #   query_params = {
  #     "q" => @name,
  #     "app_id" => ENV["EDAMAM_ID"],
  #     "app_key" => ENV["EDAMAM_KEY"]
  #   }
  #   response_url = HTTParty.get(BASE_URL, query: query_params).parsed_response
  #   return this_thing = response_url.request.last_uri.to_s
  # end

  def recipe_search
    url = "#{BASE_URL}app_id=#{ENV["EDAMAM_ID"]}&app_key=#{ENV["EDAMAM_KEY"]}&q=#{@name}"
    return response = HTTParty.get(url).parsed_response
  end
end

r = Recipe.new("chicken")
puts r.recipe_search
