# Filter through data that recipe_api_wrapper gives us

class Channel
  attr_reader :name, :id

  def initialize(name, id)
    raise ArgumentError if name == nil || id == nil

    @name = name
    @id = id
  end
end
