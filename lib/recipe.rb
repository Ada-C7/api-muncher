class Recipe
  attr_reader :uri, :label, :image, :source, :url, :ingredientLines, :totalNutrients

  def initialize(data)

    @uri = data["uri"]
    @label = data.fetch("label")
    @image = data.fetch("image")
    @source = data.fetch("source")
    @url = data.fetch("url")


    @ingredientLines = data.fetch("ingredientLines")
    @totalNutrients = data.fetch("totalNutrients")
  end

end
