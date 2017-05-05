class Recipe
  attr_reader :name, :image_url, :id, :url, :ingredients, :nutritions

  def initialize(label, image, uri, options = {})
    raise ArgumentError if label == nil || label == "" || uri == nil || uri == ""
    @name = label
    @image_url = image
    @id = uri

    @url = options[:url]
    @ingredients = options[:ingredientLines]
    @nutritions = options[:digest]
  end
end
