class Recipe

  attr_reader :label, :uri, :image, :ingredientLines, :totalNutrients

  def initialize(label, uri, image)
    @label = label
    @uri = uri
    @image = image
    @ingredientLines = ingredientLines
    @totalNutrients = totalNutrients
  end
end
