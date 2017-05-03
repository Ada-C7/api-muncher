require 'httparty'
require 'awesome_print'

class Recipe

  class RecipeException < StandardError
  end

  BASE_URL = "https://api.edamam.com/search?"
  attr_accessor :label, :image, :uri, :calories, :diet_labels, :health_labels, :ingredients

  # def initialize(label, image, uri, calories,diet_labels, health_labels, ingredients)
  def initialize(recipe_hash)
    @label = recipe_hash["label"]
    @image = recipe_hash["image"]
    index = recipe_hash["uri"].split("").find_index("_")
    @uri = recipe_hash["uri"][index+1..-1]
    @calories = recipe_hash["calories"]
    @diet_labels = recipe_hash["dietLabels"]
    @health_labels = recipe_hash["healthLabels"]
    @ingredients = recipe_hash["ingredients"]
  end

  def self.count_all(keywords)
    url = "#{BASE_URL}q=#{keywords}&app_id=#{ENV["EDAMAM_ID"]}&app_key=#{ENV["EDAMAM_KEY"]}&from=0&to=2000"
    result = HTTParty.get(url).parsed_response["hits"].length
    return result
  end

  def self.search(keywords, from)
    url = "#{BASE_URL}q=#{keywords}&app_id=#{ENV["EDAMAM_ID"]}&app_key=#{ENV["EDAMAM_KEY"]}&from=#{from}&to=#{from.to_i+10}"

    response = HTTParty.get(url)
    list_of_recipes_object = []

    if response["hits"]
      puts "Everything went well"
      recipes = response.parsed_response["hits"]
      recipes.each do |hit|

        recipe = hit["recipe"]
        recipe_object = Recipe.new(recipe)
        list_of_recipes_object << recipe_object
      end

      return list_of_recipes_object
    else
      puts "ERROR"
    end
  end

  def self.find_recipe(uri)
    print "URI:"
    print uri
    url = "#{BASE_URL}r=http://www.edamam.com/ontologies/edamam.owl%23recipe_#{uri}&app_id=#{ENV["EDAMAM_ID"]}&app_key=#{ENV["EDAMAM_KEY"]}"
    response = HTTParty.get(url).parsed_response
    print  "AAAAAAA"
    print response
    recipe = Recipe.new(response[0])
    return recipe
  end

end # end of class
