require 'httparty'

class EdamamApiWrapper
  BASE_URL =  "https://api.edamam.com/search?"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.search(search_terms)
    search = search_terms.gsub(' ','+')
    url = BASE_URL + "app_id=#{APP_ID}&" + "app_key=#{APP_KEY}&" + "q=#{search}"

    return HTTParty.get(url)
  end

  def self.getRecipe()
end
