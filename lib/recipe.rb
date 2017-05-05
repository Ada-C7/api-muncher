class Recipe
  attr_reader :name, :image, :url, :r_yield, :diet_labels, :health_labels, :ingredients, :calories, :nutrients
  attr_accessor :uri


  def initialize(name, uri, image, url=nil, r_yield=nil, diet_labels=nil, health_labels=nil, ingredients=nil, calories=nil, nutrients=nil)
    raise ArgumentError if name == nil || name == "" || uri == nil || uri == ""

    @name = name
    @uri = uri.gsub('#','%23')
    @image = image
    @url = url
    @r_yield = r_yield.to_i
    @diet_labels = diet_labels
    @health_labels = health_labels
    @ingredients = ingredients
    @calories = calories.to_i
    @nutrients = nutrients
  end
end

# uri, name, image, img_source, url, r_yield, diet_labels, health_labels, ingredients, calories)
