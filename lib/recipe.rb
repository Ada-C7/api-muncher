class Recipe
  attr_reader :name, :id, :uri, :label, :image, :source, :url

  def initialize(data)

    @name = data.fetch("name")
    @id = data.fetch("uri").split("_").last
    @uri = data.fetch("uri")
    @label = data.fetch("label")
    @image = data.fetch("image")
    @source = data.fetch("source")
    @url = data.fetch("url")
  end

end
