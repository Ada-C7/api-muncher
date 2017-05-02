class Recipe
  attr_reader :name, :link, :options

  def initialize(name, uri, options = {})
    @name = name
    @uri = uri
    @image = options[:image]
    @ingredients = options[:ingredients]
    #Add dietary Information?
  end

end
