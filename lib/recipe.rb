class Recipe

  attr_reader :name, :label, :url, :ingredientLines, :calories, :fat, :sugar, :protein, :sodium

  def initialize(recipe_hash)
    @label = recipe_hash["name"]
    @image = recipe_hash["image"]
    @url = recipe_hash["url"]

    @ingredientLines = recipe_hash["ingredientLines"]

    @calories = recipe_hash["calories"]
    @fat = recipe_hash["FAT"]["quantity"]
    @sugar = recipe_hash["SUGAR"]["quantity"]
    @protein = recipe_hash["PROCNT"]["quantity"]
    @sodium = recipe_hash["NA"]["quantity"]
  end
end
