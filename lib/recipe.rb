# Filter through data that recipe_api_wrapper gives us
class Recipe
  attr_reader :uri, :label, :image, :url, :dietLabels, :healthLabels, :ingredientLines, :calories

  def initialize(uri, label, image, url, dietLabels, healthLabels, ingredientLines, calories)
    raise ArgumentError if uri == nil || uri == "" || label == nil || label == "" || image == nil || image == "" || url == nil || url == "" || dietLabels == nil || dietLabels == "" || healthLabels == nil || healthLabels == "" || ingredientLines == nil || ingredientLines == "" || calories == nil ||calories == ""
    # change initialize parameters to a hash... will also need to change ther wrapper.
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
