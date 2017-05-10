class Recipe
  attr_reader :uri, :label, :image, :url, :source, :ingredients, :ingredientlines, :dietlabels, :healthlabels, :calories, :totalNutrients, :id

  def initialize(uri, label, image, url, source, ingredients, ingredientlines, dietlabels, healthlabels, calories, totalNutrients, id)
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
    @id = id
  end
end
