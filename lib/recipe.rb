#class that will work like a model; doesn't talk to the db so not a model


class Recipe
  attr_reader :label, :image, :url, :uri, :servings, :diet_labels, :health_labels, :ingredients, :id

  def initialize(recipe_hash)
    @label = recipe_hash[:label]
    @image = recipe_hash[:image]
    @url = recipe_hash[:url]
    @uri = recipe_hash[:uri]
    @servings = recipe_hash[:servings]
    @diet_labels = recipe_hash[:diet_labels]
    @health_labels = recipe_hash[:health_labels]
    @ingredients = recipe_hash[:ingredients]
    @id = recipe_hash[:uri].split('_')[1] if recipe_hash[:uri]
  end

# "http://www.edamam.com/ontologies/edamam.owl#recipe_38dd43bf6868595a0587a111af61b94c"

end
