class Recipe
  attr_reader :name, :uri, :image, :ingredients, :url

  def initialize(name, uri, options = {})
    @name = name
    @uri = uri
    @image = options[:image]
    @url = options[:url]
    @ingredients = options[:ingredients]
    @nutritional_info = options[:nutritional_info]
  end

end
