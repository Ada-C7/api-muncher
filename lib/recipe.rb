class Recipe

  attr_reader :title, :id, :image, :ingredients, :dietary, :recipe_url

  def initialize(id, data = {})
    @id = id

    @title = data['label']
    @image = data['image']
    @ingredients = data['ingredientLines']
    @dietary= data['healthLabels']
  end
end
