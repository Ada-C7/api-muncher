class Recipe
  attr_reader :name, :uri, :image, :ingredients, :url, :nutritional_info, :servings, :daily

  def initialize(name, uri, image=nil, url=nil, ingredients=nil, nutritional_info=nil, servings=nil, daily=nil)
    @name = name
    @uri = uri
    @image = image
    @url = url
    @ingredients = ingredients
    @nutritional_info = nutritional_info
    @servings = servings
    @daily = daily
  end

  def parse_nutritional
    if @nutritional_info == nil || @daily == nil
      return []
    end

    calories = @nutritional_info["ENERC_KCAL"]
    total_fat = @nutritional_info["FAT"]
    total_fat_percentage = @daily["FAT"]
    saturdated_fat = @nutritional_info["FASAT"]
    saturated_fat_percentage = @daily["FASAT"]
    trans_fat = @nutritional_info["FATRN"]
    sodium = @nutritional_info["NA"]
    sodium_percentage = @daily["NA"]
    carbohydrates = @nutritional_info["CHOCDF"]
    carbohydrates_percentage = @daily["CHOCDF"]
    fiber = @nutritional_info["FIBTG"]
    fiber_percentage = @daily["FIBTG"]
    sugar = @nutritional_info["SUGAR"]
    protein = @nutritional_info["PROCNT"]
    protein_percentage = @daily["PROCNT"]

    properties = [calories, total_fat, total_fat_percentage, saturdated_fat, saturated_fat_percentage, trans_fat, sodium, sodium_percentage, carbohydrates, carbohydrates_percentage, fiber, fiber_percentage, sugar, protein, protein_percentage]

    quantities = properties.map do |property|
      if !property || !property["quantity"]
        property = ""
      else
        property = property["quantity"].round(2)
      end
    end

    return quantities
  end

end
