require 'httparty'

class EdamamWrapper
  BASE_URL = "https://api.edamam.com/search?"
  KEY = ENV['EDAMAM_KEY']
  ID = ENV['APP_ID']

  def self.getRecipes(search_term)
    url = BASE_URL + "q=#{search_term}&app_id =#{ID}&app_key=#{KEY}&from=0&to=50"

    response = HTTParty.get(url)

    recipes = []
    if response["hits"]
      response["hits"].each do |hash|
        #hits is an array of hashes
        #each hash has "recipe" as key
        name = hash["recipe"]["label"]
        uri = hash["recipe"]["uri"]
        image = hash["recipe"]["image"]
        recipes << Recipe.new(name, uri, image)
      end
    end
    return recipes
  end

  def self.findRecipe(id)
    url = BASE_URL + "r=#{id}&app_id =#{ID}&app_key=#{KEY}"

    begin
      response = HTTParty.get(url).parsed_response
    rescue
      return nil
    end


      name = response[0]["label"]
      uri = response[0]["uri"]
      image = response[0]["image"]
      options = {}
      options[:source] = response[0]["source"]
      options[:url] = response[0]["url"]
      options[:yield] = response[0]["yield"]
      options[:ingredientLines] = response[0]["ingredientLines"]
      options[:dietLabels] = response[0]["dietLabels"]
      return Recipe.new(name, uri, image, options)


  end

end
