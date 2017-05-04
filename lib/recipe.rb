class Recipe

  attr_reader :label, :url, :image, :ingredients, :allergy_info, :uri, :nutrients

  def initialize(label, url,image, ingredients, allergy_info,uri, nutrients)


    @label = label
    @url = url
    @image = image
    @ingredients = ingredients
    @allergy_info = allergy_info
    @uri = uri
    @nutrients = nutrients
  end

end
