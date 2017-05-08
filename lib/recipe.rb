class Recipe < EdamamApiWrapper

  NUTRIENTS = ["ENERC_KCAL", "FAT", "FASAT", "CHOCDF", "FIBTG", "SUGAR", "PROCNT", "VITA_RAE", "VITC", "CA", "FE"]

  attr_reader :url, :name, :uri, :image, :ingredients, :diet_info,  :RDA,  :yield, :serving_size

  def initialize(recipe)
    super
    @url = recipe["url"]
    @yield = recipe["yield"]
    @serving_size = recipe["totalWeight"]
    @ingredients = recipe["ingredientLines"]
    @diet_info =  nutrition_info( { n: recipe["totalNutrients"], rda: recipe["totalDaily"] })
  end

  def nutrition_info (h)
    # list of nutrients to display
    nutrients = NUTRIENTS.map do |nutrient|
      n = h[:n].fetch(nutrient)
      n["RDA"] = h[:rda].fetch(nutrient,"")["quantity"]
      n
    end

  end

  def self.one(search_terms)
    new (api_call(search_terms).first)
  end

end
