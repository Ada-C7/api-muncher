class Recipe
  attr_reader :name, :uri, :image, :ingredients, :url

  def initialize(name, uri, image=nil, url=nil, ingredients=nil, nutritional_info=nil)
    @name = name
    @uri = uri
    @image = image
    @url = url
    @ingredients = ingredients
    @nutritional_info = nutritional_info
  end

end
