class Recipe
  attr_reader :label, :uri, :image

  def initialize(label, uri, image, options = {})
    @label = label
    @uri = uri
    @image = image
  end
end
