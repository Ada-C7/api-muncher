require 'HTTParty'
require '.env'

class RecipesController < ApplicationController
  def index
  end

  def search(search_term)
    query_params = {
      "token" => TOKEN,
      "channel" => @name,
      "text" => message,
      "username" => "Roberts-Robit",
      "icon_emoji" => ":robot_face",
      "as_user" => "false"
    }
    results = HTTParty.get("https://api.edamam.com/search?q=#{search_term}&app_id=${EDAMAM_ID}&app_key=${EDAMAM_TOKEN}&from=0&to=3")

    return results
  end

  def show
  end
end


# Example GET request
# curl "https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}&from=0&to=3&calories=gte%20591,%20lte%20722&health=alcohol-free"
