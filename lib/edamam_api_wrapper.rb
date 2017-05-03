require 'httparty'


class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  EDAMAM_ID = ENV["EDAMAM_ID"]
  EDAMAM_KEY = ENV["EDAMAM_KEY"]


  def self.querySearch(search_terms, from, to)
    #ADD BACK IN gluten = nil, dairy = nil, vegetarian = nil, kosher = nil
    url = BASE_URL + "app_id=#{EDAMAM_ID}&" + "app_key=#{EDAMAM_KEY}&" + "q=#{search_terms}"
    # url = "https://api.edamam.com/search?app_id=11902651&app_key=846afffff836ed54f5b2a6c2f1068cf5&q=chicken&from=0&to=9"

# + "from=#{params[:from]}&" + "to=#{params[:to]}"
    response = HTTParty.get(url)
    return response
    
    # search_results = response["hits"]
    # recipes = []
    # if search_results
    #   search_results.each do |recipe|
    #     recipes << RecipeResult.new(recipe["recipe"]["label"], recipe["recipe"]["url"], recipe["recipe"]["image"], recipe["recipe"]["ingredientLines"])
    #   end
    # end
    #
    # return recipes
  end

  def self.getRecipe(recipe_id)
  end

end
