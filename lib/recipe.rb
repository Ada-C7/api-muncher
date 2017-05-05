class Recipe
  attr_reader :name, :image
  attr_accessor :uri


  def initialize(name, uri, image)
    @name = name
    @uri = uri.gsub('#','%23')
    @image = image
  end
end
