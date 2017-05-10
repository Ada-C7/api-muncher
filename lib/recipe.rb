class Recipe
  attr_reader :name, :id

  def initialize(name, id)
    raise ArgumentError if name == nil || name == "" || id == nil || id == ""

    @name = name
    @id = id
  end

end
