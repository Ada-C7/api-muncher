class Recipe < EdamamApiWrapper


  attr_reader :name, :uri, :image, :ingredients, :diet_info, :url, :RDA,  :yield, :serving_size

  def initialize(recipe)
    super
    @url = recipe["url"]
    @yield = recipe["yield"]
    @serving_size = recipe["totalWeight"]
    @ingredients = recipe["ingredientLines"]
    @diet_info =  nutrition_info({n: recipe["totalNutrients"], RDA: recipe["totalDaily"]})
  end

  def nutrition_info (h)
    # list of nutrients to display
    nutrients = ["ENERC_KCAL", "FAT", "FASAT", "CHOCDF", "FIBTG", "SUGAR", "PROCNT", "VITA_RAE", "VITC", "CA", "FE"]

    # combine quantity and RDA%

    nutrients.map! do |nutrient|
      n = h[:n].fetch(nutrient)
      n["RDA"] = h[:RDA].fetch(nutrient,"")["quantity"]
    end
    return nutrients
  end

  def self.one(search_terms)
    new (api_call(search_terms).first)
  end

end
