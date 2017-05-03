class Recipe
  attr_reader :name, :uri, :image, :ingredients

  def initialize(uri, name, options = {})
    @name = name
    @uri = uri
    @image = options[:image]
    @ingredients = options[:ingredients]
    #Add dietary Information?
  end

end
