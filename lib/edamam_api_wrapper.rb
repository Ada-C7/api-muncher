require 'httparty'


class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  EDAMAM_ID = ENV["EDAMAM_ID"]
  EDAMAM_KEY = ENV["EDAMAM_KEY"]


  def self.querySearch(search_terms, from, to)
    #ADD BACK IN gluten = nil, dairy = nil, vegetarian = nil, kosher = nil
    url = BASE_URL + "app_id=#{EDAMAM_ID}&" + "app_key=#{EDAMAM_KEY}&" + "q=#{search_terms}&" + "from=#{from}&" + "to=#{to}"

    response = HTTParty.get(url)
    search_results = response["hits"]
    recipes = []
    recipes << response["count"]
    if search_results
      search_results.each do |recipe|
        recipes << RecipeResult.new(recipe["recipe"]["label"],  recipe["recipe"]["image"],  recipe["recipe"]["uri"].gsub("#","%23"))
      end
    end

    return recipes
    raise
  end

  def self.getRecipe(recipe_uri)
    url = BASE_URL + "app_id=#{EDAMAM_ID}&" + "app_key=#{EDAMAM_KEY}&" + "r=#{recipe_uri}"

    response = HTTParty.get(url)
    recipe_hash = response.first
    if recipe_hash
      recipe = RecipeResult.new(recipe_hash["label"], recipe_hash["image"], recipe_hash["uri"], recipe_hash["url"], recipe_hash["ingredientLines"], recipe_hash["healthLabels"], recipe_hash["source"],
      recipe_hash["totalNutrients"])

    end


    return recipe
  end

end
