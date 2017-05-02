class Recipe
  attr_reader :name, :link, :options

  def initialize(uri, name, options = {})
    @name = name
    @uri = uri
    @image = options[:image]
    @ingredients = options[:ingredients]
    #Add dietary Information?
  end

end
