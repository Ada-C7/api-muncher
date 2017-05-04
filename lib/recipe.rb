class Recipe
  attr_reader :name, :uri, :image


  def initialize(name, uri, image)
    @name = name
    @uri = uri
    @image = image 
  end
end
