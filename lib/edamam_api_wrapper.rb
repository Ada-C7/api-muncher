class EdamamApiWrapper
  base = "https://api.edamam.com/search?"
  app_id = ENV["EDAMAM_ID"]
  app_key = ENV["EDAMAM_KEY"]
  BASE_URL = "#{base}app_id=#{app_id}&app_key=#{app_key}&health=vegan&"

  def self.list_recipes(search, page = 1)
    return [] if search == "" || search == nil
    page_start = (page - 1) * 10
    page_end = page_start + 10
    url = BASE_URL + "q=#{search}&from=#{page_start}&to=#{page_end}"
    response =  HTTParty.get(url)

    if !response["hits"].empty?
      return response["hits"].map do |recipe|
        Recipe.new(recipe["recipe"]["label"], recipe["recipe"]["uri"].partition("recipe_").last, recipe["recipe"]["image"])
      end
    else
      return []
    end
  end

  def self.get_recipe(id)
    url = BASE_URL + "r=http://www.edamam.com/ontologies/edamam.owl%23recipe_#{id}"
    response = HTTParty.get(url)[0]

    if response
      nutrients = []

      response["digest"].each do |nutrient|
        nutrients << nutrient
        if nutrient["sub"]
          nutrient["sub"].each { |sub| nutrients << sub }
        end
      end

      options = {
        recipe_link: response["url"],
        ingredients: response["ingredientLines"],
        diet_labels: response["dietLabels"],
        health_labels: response["healthLabels"],
        calories: response["calories"],
        nutrients: nutrients
      }
      return Recipe.new(response["label"], id, response["image"], options )
    else
      return nil
    end
  end
end
