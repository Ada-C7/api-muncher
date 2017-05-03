class Recipe

  attr_reader :label, :url, :image, :ingredients, :dietery_info
  def initialize(label, url, image, ingredients, dietery_info)
    @label = label
    @url = url
    @image = image
    @ingredients = ingredients
    @dietery_info = dietery_info
  end


end
