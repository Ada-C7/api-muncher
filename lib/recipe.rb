class Recipe
  attr_reader :label, :uri

  def initialize(label, id, options= {})
    @label = label
    @uri = uri
  end
end
