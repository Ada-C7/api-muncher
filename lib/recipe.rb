# Filter through data that recipe_api_wrapper gives us
class Recipe
  attr_reader :uri, :label, :image, :url, :dietLabels, :healthLabels, :ingredientLines, :calories

  def initialize(uri, label, image, url, dietLabels, healthLabels, ingredientLines, calories)
    # try to change this into a hash...
    @uri = uri
    @label = label
    @image = image
    @url = url
    @dietLabels = dietLabels
    @healthLabels = healthLabels
    @ingredientLines = ingredientLines
    @calories = calories
  end
end
