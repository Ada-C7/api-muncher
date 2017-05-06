require 'json'

class Recipe

  attr_reader :label, :image, :uri

  def initialize(label, image, uri)
    @label = label
    @image = image
    @uri = uri
  end

  def self.search(search_term)
    ##NOTE: HARD CODE NUM OF RETURNS ON END (TO=)
    url = "https://api.edamam.com/search?app_key=#{ENV['APP_KEY']}&app_id=#{ENV['APP_ID']}&q=#{search_term}&to=10"

    response = HTTParty.get(url).parsed_response

    recipes_list = []

    if response['count'] == 0
      return recipes_list
    else
      10.times do |count|
        label = response['hits'][count]['recipe']['label']
        image = response['hits'][count]['recipe']['image']
        uri = response['hits'][count]['recipe']['uri']

        recipes_list << Recipe.new(label, image, uri)
      end
    end
    return recipes_list
  end

  def list_display
    ##LOGIC FOR LIST DISPLAY
  end

  def self.show_recipe(uri)
    url = "https://api.edamam.com/search?app_key=#{ENV['APP_KEY']}&app_id=#{ENV['APP_ID']}&r=http://www.edamam.com/ontologies/edamam.owl%23#{uri[1..-1]}"

    response = HTTParty.get(url).parsed_response

    recipe_components = {}

    recipe_components[:label] = response[0]['label']
    recipe_components[:url] = response[0]['url']
    recipe_components[:ingredients] = response[0]['ingredientLines']
    recipe_components[:diet] = response[0]['dietLabels']

    return recipe_components

  end
end
