class Recipe
  attr_reader :name, :uri, :image, :ingredients, :url, :nutritional_info, :servings, :daily

  def initialize(name, uri, image=nil, url=nil, ingredients=nil, nutritional_info=nil, servings=nil, daily=nil)
    @name = name
    @uri = uri
    @image = image
    @url = url
    @ingredients = ingredients
    @nutritional_info = nutritional_info
    @servings = servings
    @daily = daily
  end

end
