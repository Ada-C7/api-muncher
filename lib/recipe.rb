class Recipe < EdamamApiWrapper
  def initialize(recipe)
    super
    @ingredients = recipe["ingredientLines"]
    @diet_info = recipe["totalNutrients"]
    @RDA = recipe["totalDaily"]
    @url = recipe["url"]
    @yield = recipe["yield"]
    @serving_size = recipe["totalWeight"]
  end

  def self.one(search_terms)
    new (api_call(search_terms).first)
  end

end
