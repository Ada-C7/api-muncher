require "httparty"

class RecipeApi

  BASE_URI = 'https://api.edamam.com'

  def self.find(id)
    response = HTTParty.get("#{BASE_URI}/search?app_id=05742278&app_key=1d919484b6fe91b3bacea124d85dd03a&r=http://www.edamam.com/ontologies/edamam.owl%23r#{id}")

    recipe_data = response.parsed_response[0]
    recipe = Recipe.new(id, recipe_data)

    return recipe
  end

  def self.search(query, from_param = 0)
    to_param = from_param + 10
    final_results = []

    response = HTTParty.get("#{BASE_URI}/search?app_id=05742278&app_key=1d919484b6fe91b3bacea124d85dd03a&q=#{query}&from=#{from_param}&to=#{to_param}")

    data = response.parsed_response['hits']
    data.each do |entry|

      id = entry['recipe']['uri'].split('#')[1]
      final_results << Recipe.new(id, entry['recipe'])
    end
    return final_results
  end
end
