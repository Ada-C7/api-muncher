class Recipe

  attr_reader :id, :label, :image, :url, :ingredientLines, :calories, :fat, :sugar, :protein, :sodium

  def initialize(recipe_hash)
    @id = recipe_hash["id"]
    @label = recipe_hash["label"]
    @image = recipe_hash["image"]
    @url = recipe_hash["url"]
    @ingredientLines = recipe_hash["ingredientLines"]
    @calories = recipe_hash["calories"]
    @fat = recipe_hash["fat"]
    @sugar = recipe_hash["sugar"]
    @protein = recipe_hash["protein"]
    @sodium = recipe_hash["sodium"]
  end
end
