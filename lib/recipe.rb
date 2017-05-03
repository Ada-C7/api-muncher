require 'httparty'
require 'awesome_print'

class Recipe

  class RecipeException < StandardError
  end

  BASE_URL = "https://api.edamam.com/search?"
  attr_accessor :label, :image, :uri, :calories, :diet_labels, :health_labels, :ingredients

  def initialize(label, image, uri, calories,diet_labels, health_labels, ingredients)
    @label = label
    @image = image
    @uri = uri
    @calories = calories
    @diet_labels = diet_labels
    @health_labels = health_labels
    @ingredients = ingredients
  end

  def self.count_all(keywords)
    url = "#{BASE_URL}q=#{keywords}&app_id=#{ENV["EDAMAM_ID"]}&app_key=#{ENV["EDAMAM_KEY"]}&from=0&to=2000"
    result = HTTParty.get(url).parsed_response["hits"].length
    return result
  end

  def self.search(keywords, from)
    url = "#{BASE_URL}q=#{keywords}&app_id=#{ENV["EDAMAM_ID"]}&app_key=#{ENV["EDAMAM_KEY"]}&from=#{from}&to=#{from.to_i+10}"

    response = HTTParty.get(url)
    list_of_recepies_object = []

    if response["hits"]
      puts "Everything went well"
      recepies = response.parsed_response["hits"]
      recepies.each do |hit|
        recipe = hit["recipe"]
        recipe_object = Recipe.new(recipe["label"], recipe["image"],recipe["uri"], recipe["calories"], recipe["dietLabels"], recipe["healthLabels"] , recipe["ingredients"])
        list_of_recepies_object << recipe_object
      end

      return list_of_recepies_object
    else
      puts "ERROR"
    end

    def self.find_recipe(uri)
      url = "#{BASE_URL}r=#{uri}&app_id=#{ENV["EDAMAM_ID"]}&app_key=#{ENV["EDAMAM_KEY"]}"
      response = HTTParty.get(url)
      recipe = Recipe.new(response[0])
      return recipe
    end
  end

end # end of class
