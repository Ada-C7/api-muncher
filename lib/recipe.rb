class Recipe
  attr_reader :name, :image_url, :id, :url, :ingredients, :nutrients, :daily_nutrients, :calories

  def initialize(label, image, uri, url, options = {})
    raise ArgumentError if label == nil || label == "" || uri == nil || uri == ""
    @name = label
    @image_url = image
    @id = uri
    @url = url

    @ingredients = options[:ingredientLines]
    @nutrients = options[:totalNutrients]
    @daily_nutrients = options[:totalDaily]
    @calories = options[:digest]
  end
end
