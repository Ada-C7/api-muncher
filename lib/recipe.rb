class Recipe
  attr_reader :id, :label, :image_url, :ingredients, :dietary_information, :original_recipe

  def initialize(info)
    @id = info[:recipe_id]
    @label = info[:label]
    @image_url = info[:image_url]
    @ingredients = info[:ingredients]
    @dietary_information = info[:dietary_information]
    @original_recipe = info[:original_recipe]
  end

  def self.list_of_recipes(response)
    list = []# pass in recipe_data["hits"]
    response.each do |recipe_hash|
      

      info = {
              recipe_id: api_data[:uri][52..-1],
              label: api_data[:label],
              image_url: api_data[:image]
             }
      list << Recipe.new(info)
    end
    return list
  end

  def self.individual_recipe(response)
    info = Hash.new
    info[:label] = response["label"]
    info[:image_url] = response["image"]
    info[:original_recipe] = response["url"]
    # you want ingredientLines
    info[:ingredients] = response["ingredientLines"]
    info[:dietary_information] = response["totalNutrients"]
    return Recipe.new(info)
  end
end
