class Recipe

  attr_reader :label, :uri, :image, :recipe_source, :url, :ingredientLines, :totalNutrients

  def initialize(options)
    @label = options[:label]
    @uri = options[:uri]
    @image = options[:image]
    @url = options[:url]
    @recipe_source = options[:recipe_source]
    @ingredientLines = options[:ingredientLines]
    @totalNutrients = options[:totalNutrients]
  end
end
