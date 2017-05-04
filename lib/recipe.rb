class Recipe

  attr_reader :label, :url, :image, :ingredients, :dietery_info, :uri
  def initialize(label, url, image, ingredients, dietery_info,uri)
    @label = label
    @url = url
    @image = image
    @ingredients = ingredients
    @dietery_info = dietery_info
    @uri = uri
  end


end
