class Recipe
  attr_reader :name, :image_url, :id, :url, :ingredients, :nutrients, :daily_nutrients, :calories

  def initialize(label, image, uri, options = {})
    raise ArgumentError if label == nil || label == "" || uri == nil || uri == ""
    @name = label
    @image_url = image
    @id = uri

    @url = options[:url]
    @ingredients = options[:ingredientLines]
    @calories = options[:digest]
  end
end
