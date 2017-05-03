class EdamamApiWrapper
  base = "https://api.edamam.com/search?"
  app_id = ENV["EDAMAM_ID"]
  app_key = ENV["EDAMAM_KEY"]
  BASE_URL = "#{base}app_id=#{app_id}&app_key=#{app_key}&"

  def self.list_recipes(search)
    search = search.gsub(" ", "%20")
    url = BASE_URL + "q=#{search}"
    response =  HTTParty.get(url)

    if response["hits"]
      return response["hits"].map do |recipe|
        Recipe.new(recipe["uri"].gsub("#", "%23"), recipe["label"])
      end
    else
      return []
    end
  end
end
