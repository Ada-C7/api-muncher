class Recipe
  attr_reader :uri, :label, :image

  def initialize(uri, label, image)
    @uri = uri
    @label = label
    @image = image
  end
end
