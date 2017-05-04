#class that will work like a model; doesn't talk to the db so not a model


class Recipe
  attr_reader :label, :image, :url, :uri, :servings, :diet_labels, :health_labels, :ingredients, :id

  def initialize(label, image, url, uri, servings, diet_labels, health_labels, ingredients)
    @label = label
    @image = image
    @url = url
    @uri = uri
    @servings = servings
    @diet_labels = diet_labels
    @health_labels = health_labels
    @ingredients = ingredients
    @id = uri.split('_')[1]
  end

# "http://www.edamam.com/ontologies/edamam.owl#recipe_38dd43bf6868595a0587a111af61b94c"

end
