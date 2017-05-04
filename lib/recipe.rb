# Filter through data that recipe_api_wrapper gives us
class Recipe
  attr_reader :uri, :label, :image, :url, :dietLabels, :healthLabels, :ingredientLines

  def initialize(uri, label, image, url, dietLabels, url, dietLabels, healthLabels, ingredientLines)
    @uri = uri
    @label = label
    @image = image
    @url = url
    @dietLabels = dietLabels
    @healthLabels = healthLabels
    @ingredientLines = ingredientLines
  end
end
