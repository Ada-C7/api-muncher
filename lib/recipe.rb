class Recipe
  attr_reader :name, :id, :label, :image, :source, :url

  def initialize(data)

    @name = data.fetch("name")
    @id = data.fetch("uri").split("_").last
    @label = data.fetch("label")
    @image = data.fetch("image")
    @source = data.fetch("source")
    @url = data.fetch("url")
  end

end
