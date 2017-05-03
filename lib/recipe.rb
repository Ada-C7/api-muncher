class Recipe
  attr_reader :uri, :label, :image

  def initialize(uuri, label, image, url, source, ingredients, ingredientlines, dietlabels, healthlabels, calories, totalNutrients)
    @uri = uri
    @label = label
    @image = image
    @url = url
    @source = source
    @ingredients = ingredients
    @ingredientlines = ingredientlines
    @dietlabels = dietlabels
    @healthlabels = healthlabels
    @calories = calories
    @totalNutrients = totalNutrients
  end
end
