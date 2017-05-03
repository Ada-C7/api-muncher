require 'HTTParty'
require '.env'


BASE_URL = "https://api.edamam.com/search"

class Recipes
  attr_accessor :name

  def initialize(name)
    @name = name
  end
# Should this be self.all ? send(message) is a post in the class example (posting to slack)
  def self.search(query)
    query_params = {
      q = @name
      app_id = EDAMAM_ID
      app_key = EDAMAM_TOKEN
    }

    url = "#{BASE_URL}?app_key=#{app_key}&app_id=#{app_id}&q=#{@name}"
  end
end

# Example GET request
# curl "https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}&from=0&to=3&calories=gte%20591,%20lte%20722&health=alcohol-free"
