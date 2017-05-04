class Recipe

  attr_reader :label, :url, :image, :ingredients, :dietery_info, :uri, :nutrients

  def initialize(label, url,image, ingredients, dietery_info,uri, nutrients)


    @label = label
    @url = url
    @image = image
    @ingredients = ingredients
    @dietery_info = dietery_info
    @uri = uri
    @nutrients = nutrients
  end

end
