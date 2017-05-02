#class that will work like a model; doesn't talk to the db so not a model


class Recipe
  attr_reader :label, :image, :url

  def initialize(label, image, url)
    @label = label
    @image = image
    @url = url
  end
  
end
