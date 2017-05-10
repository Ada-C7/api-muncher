class Recipe

  attr_reader :label, :url, :image, :ingredients, :allergy_info, :uri, :nutrients

  # def initialize(label, url,image, ingredients, allergy_info,uri, nutrients)
  def initialize(raw_recipe_data)

    @label = raw_recipe_data['label']
    @url = raw_recipe_data['url']
    @image = raw_recipe_data['image']
    @ingredients = raw_recipe_data['ingredientLines']
    @allergy_info = raw_recipe_data['healthLabels']
    @uri = raw_recipe_data['uri']
    @nutrients = raw_recipe_data['totalNutrients']
  end

end
