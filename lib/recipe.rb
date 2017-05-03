class Recipe
  attr_reader :name, :id

  def initialize(label, image, uri, url)
    raise ArgumentError if name == nil || name == "" || id == nil || id == ""
    @name = label
    @image_url = image
    @id = uri
    @url = url
  end
end
