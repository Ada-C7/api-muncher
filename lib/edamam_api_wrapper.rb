class EdamamApiWrapper
  base = "https://api.edamam.com/search?"
  app_id = ENV["EDAMAM_ID"]
  app_key = ENV["EDAMAM_KEY"]
  BASE_URL = "#{base}app_id=#{app_id}&app_key=#{app_key}&health=vegan&"

  def self.list_recipes(search)
    search = search.gsub(" ", "%20")
    url = BASE_URL + "q=#{search}"
    response =  HTTParty.get(url)

    if response["hits"]
      return response["hits"].map do |recipe|
        Recipe.new(recipe["recipe"]["label"], recipe["recipe"]["uri"].gsub("#", "%23"))
      end
    else
      return []
    end
  end
end
