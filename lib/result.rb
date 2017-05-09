class Result

  attr_reader :recipe_label, :uri, :image

  def initialize(recipe_label, image, uri)
    @recipe_label = recipe_label
    @image = image
    @uri = uri
  end

end
