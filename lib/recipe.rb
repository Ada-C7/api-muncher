class Recipe
  attr_reader :uri, :label, :image, :source, :url, :ingredientLines, :totalNutrients

  def initialize(data)

    @uri = data["uri"]
    @label = data["label"]
    @image = data["image"]
    @source = data["source"]
    @url = data["url"]


    @ingredientLines = data["ingredientLines"]
    @totalNutrients = data["totalNutrients"]
  end

end
