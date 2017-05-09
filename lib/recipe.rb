class Recipe
  attr_reader :label, :id, :image, :recipe_link, :ingredients, :diet_labels, :health_labels, :calories, :nutrients

  def initialize(label, id, image, options = {})
    @label = label
    @id = id
    @image = image

    @recipe_link = options[:recipe_link]
    @ingredients = options[:ingredients]
    @diet_labels = options[:diet_labels]
    @health_labels = options[:health_labels]
    @calories = options[:calories]
    @nutrients = options[:nutrients]
  end
end
