require 'httparty'

class EdamamWrapper
  BASE_URL = "https://api.edamam.com/search?"
  KEY = ENV['EDAMAM_KEY']
  ID = ENV['APP_ID']

  def self.getRecipes(search_term)
    url = BASE_URL + "q=#{search_term}&app_id =#{ID}&app_key=#{KEY}"

    response = HTTParty.get(url)

    recipes = []
    if response["hits"]


    # response["hits"][0]["recipe"]["uri"]
    # response["hits"]["recipe"]["label"]
    # response["hits"]["recipe"]["image"]
    # and display this on the index page
    # mebbe I should make a recipe class


  end
end
