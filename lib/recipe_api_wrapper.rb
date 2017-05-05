require 'httparty'
require 'awesome_print'

class RecipeApiWrapper

  class RecipeException < StandardError
  end

  BASE_URL = "https://api.edamam.com/search?"
  attr_accessor :label, :image, :uri, :calories, :diet_labels, :health_labels, :ingredients

  def initialize(recipe_hash)
    @label = recipe_hash["label"]
    @image = recipe_hash["image"]
    @uri = recipe_hash["uri"][51..-1]
    @calories = recipe_hash["calories"]
    @diet_labels = recipe_hash["dietLabels"]
    @health_labels = recipe_hash["healthLabels"]
    @ingredients = recipe_hash["ingredients"]
  end

  def self.all(keywords,  vegan=nil, kosher=nil, vegetarian=nil, paleo=nil)
    health_options = RecipeApiWrapper.health_options(vegan, kosher, vegetarian, paleo)
    url = "#{BASE_URL}q=#{keywords}&app_id=#{ENV["EDAMAM_ID"]}&app_key=#{ENV["EDAMAM_KEY"]}&from=0&to=300#{health_options}"
    result = HTTParty.get(url).parsed_response["hits"]
    return result
  end

  def self.search(keywords, from,  vegan=nil, kosher=nil, vegetarian=nil, paleo=nil)
    health_options = RecipeApiWrapper.health_options(vegan, kosher, vegetarian, paleo)
    url = "#{BASE_URL}q=#{keywords}&app_id=#{ENV["EDAMAM_ID"]}&app_key=#{ENV["EDAMAM_KEY"]}&from=#{from}&to=#{from.to_i+12}#{health_options}"

    response = HTTParty.get(url)
    list_of_recipes_object = []
    if response["hits"]
      recipes = response.parsed_response["hits"]
      recipes.each do |hit|
        recipe = hit["recipe"]
        recipe_object = RecipeApiWrapper.new(recipe)

        list_of_recipes_object << recipe_object
      end
      return list_of_recipes_object
    # else
    #   raise RecipeException.new(response) # for some
    end
  end

  def self.find_recipe(uri)
    url = "#{BASE_URL}r=http://www.edamam.com/ontologies/edamam.owl%23recipe_#{uri}&app_id=#{ENV["EDAMAM_ID"]}&app_key=#{ENV["EDAMAM_KEY"]}"
    response = HTTParty.get(url).parsed_response
    puts "API WRAPPER RESPONSE IN FIND RECIPE:"
    puts response[0]
    recipe = RecipeApiWrapper.new(response[0])
    return recipe
  end

  private
  def self.health_options(vegan, kosher, vegetarian, paleo)
    health_options = ""
    health_options += "&health=" + vegan if vegan != nil
    health_options += "&health=" + kosher if kosher != nil
    health_options += "&health=" + vegetarian if vegetarian != nil
    health_options += "&health=" + paleo if paleo != nil
    return health_options
  end
end
