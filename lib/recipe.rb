class Recipe
  attr_reader :name, :image, :uri, :ingredients, :link, :diet

  def initialize(name, image, uri, options = {})
    @name = name
    @image = image
    @uri = URI.escape(uri) # like using gsub, gets rid of the # space-marker and replaces with %23
    @ingredients = options[:ingredients]
    @link = options[:link]
    @diet = options[:diet]
  end
end
