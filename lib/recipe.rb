class Recipe
  attr_accessor :name, :uri, :image, :original_recipe, :health_labels, :ingredients
  BASE_URL = "https://api.edamam.com/search?"
  def initialize(params)
    @name = params[:name]
    @image = params[:image]
    @original_recipe = params[:original_recipe]
    @ingredients = params[:ingredients]
    @health_labels = params[:health_labels]
    @uri = params[:uri]
  end

  def self.all_by_search_term(search, from, to)
    query_params = {
      "q" => search,
      "app_id" => ENV["EDAMAM_ID"],
      "app_key" => ENV["EDAMAM_KEY"],
      "Health" => "gluten-free",
      "from" => from,
      "to" => to
    }
    response_url = HTTParty.get(BASE_URL, query: query_params).parsed_response

    if response_url["hits"] != nil
    recipe_list = response_url["hits"].map do |recipe|
        recipe_data = {
          name: recipe["recipe"]["label"],
          image: recipe["recipe"]["image"],
          original_recipe: recipe["recipe"]["url"],
          ingredients: recipe["recipe"]["ingredientLines"],
          health_labels: recipe["recipe"]["healthLabels"],
          uri: recipe["recipe"]["uri"]
        }
        self.new(recipe_data)
      end
      else
        raise ArgumentError.new "That's not a valid search term"
      end
    return recipe_list
  end

  def self.find_by_name(uri)
    query_params = {
      "r" => uri,
      "app_id" => ENV["EDAMAM_ID"],
      "app_key" => ENV["EDAMAM_KEY"],
    }
    recipe = HTTParty.get(BASE_URL, query: query_params).parsed_response[0]
    if recipe != nil
    recipe_data = {
      name: recipe["label"],
      image: recipe["image"],
      original_recipe: recipe["url"],
      ingredients: recipe["ingredientLines"],
      health_labels: recipe["healthLabels"],
      uri: recipe["uri"]
    }
    return self.new(recipe_data)
  else
    raise ArgumentError.new "That's not a valid search URI."
  end
  end

end
