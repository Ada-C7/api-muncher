require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  TOKEN = ENV["EDAMAM_TOKEN"]
  APP_ID = dc26f0f1

  def self.listRecipes(search_term)
    token ||= TOKEN
    url = BASE_URL + "?g=#{search_term.gsub(" ", "%20")}&" + APP_ID + "&" + TOKEN

    response = HTTParty.get(url)

    recipes = []
    if response["recipes"]
      response["reicpes"].each do |recipe|
        label = recipe["label"]
        image = recipe["image"]
        uri = recipe["uri"]
        url = recipe["url"]

        recipes << Recipe.new(label, image, uri, url)
      end
    end

    return channels
    end
  end

end
