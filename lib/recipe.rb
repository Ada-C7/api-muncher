
class Recipe
  class RecipeException < StandardError
  end

  BASE_URL = "https://api.edamam.com/search?"
  RECIPE_URL = "http://www.edamam.com/ontologies/edamam.owl%23"


  # attr_reader :search_term, :health, :diet

  def initialize
  end

  def send_search(key_word, from, to, health)
    query_params =
      "app_id=#{ENV["App_ID"]}"+
      "&app_key=#{ENV["App_Key"]}"+
      "&q=#{key_word}"+
      "&from=#{from}"+
      "&to=#{to}"


    health_params = ""
    if health != nil
      health.each do |h|
        health_params << "&health=#{h}"
      end
    end
    url = BASE_URL + query_params + health_params
    response = HTTParty.get(url)
    return response

    puts "Sent request to #{response.request.last_uri.to_s}"

  end

  def find_this_recipe(uri)

    query_params = {
      "app_id" => ENV["App_ID"],
      "app_key" => ENV["App_Key"],
      "r" => RECIPE_URL + uri
    }
    response = HTTParty.get(BASE_URL, query: query_params)

  end
end
