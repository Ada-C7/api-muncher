require 'HTTParty'

class Recipe
  BASE_URL = 'https://api.edamam.com/search'
  attr_reader :uri, :label, :image, :url, :health_labels, :ingredient_lines

  def initialize(hash_params)
    @uri = hash_params[:uri]
    @label = hash_params[:label]
    @image = hash_params[:image]
    @url = hash_params[:url]
    @health_labels = hash_params[:health_labels]
    @ingredient_lines = hash_params[:ingredient_lines]
  end

  def self.all_recipes(search)
    #the recipes returned after the search
    #this hash will have the name of the recipe, the photo link *and maybe link to
    recipes = []
    #takes the base url, the app id, the app key(token), the search(fromt the user params) and adds the gluten free params
    url ="#{BASE_URL}?app_id=#{ENV["EDAMAM_ID"]}&app_key=#{ENV["EDAMAM_TOKEN"]}&q=#{search}&healthLabels=Gluten-Free"
    #response getss the url and feeds it to the browser through HTTParty
    response = HTTParty.get(url).parsed_response

    if response["hits"] != 0
      response["hits"].each do |recipe_object|
        recipes << Recipe.new({uri: recipe_object["recipe"]["uri"].split("_").last, label: recipe_object["recipe"]["label"], image: recipe_object["recipe"]["image"], url: recipe_object["recipe"]["url"], health_labels: recipe_object["recipe"]["healthLabels"], ingredient_lines: recipe_object["recipe"]["ingredientLines"]})
        #the uri is split after the underscore for the unique identifier
      end
      return recipes
    end

    else
      raise ArgumentError.new("Whoops! There are no Gluten Free Recipes with that Search")
    # end
  end

  def self.a_recipe(search)
    url ="#{BASE_URL}?app_id=#{ENV["EDAMAM_ID"]}&app_key=#{ENV["EDAMAM_TOKEN"]}&q=#{search}"

    response = HTTParty.get(url).parsed_response["hits"][0]
    the_recipe = Recipe.new({uri: response["recipe"]["uri"].split("_").last, label: response["recipe"]["label"], image: response["recipe"]["image"], url: response["recipe"]["url"], health_labels: response["recipe"]["healthLabels"], ingredient_lines: response["recipe"]["ingredientLines"]})
    return the_recipe
  end

end
