require 'httparty'
require 'recipe'


class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.listRecipes(search_words)
   url = BASE_URL + "?q=#{ search_words }" + "&app_id=#{ APP_ID }" + "&app_key=#{ APP_KEY }"
   response = HTTParty.get(url)
   @recipes = []
  if response["hits"]
   response["hits"].each do | hit |
     options = {
     label: hit["recipe"]["label"],
     image: hit["recipe"]["image"],
     uri: hit["recipe"]["uri"].split("_").last.to_s
   }
     @recipes << Recipe.new(options)
    end
  end
   return @recipes
  end

  # def self.sendMessage(channel_id, text, token = nil)
  #
  #   token ||= TOKEN
  #   # url = BASE_URL + "chat.postMessage?" + "token=#{ token }&" + "channel=#{channel_id}&" + "text=#{text}"
  #   # # raise
  #   # response = HTTParty.get(url)
  #   #
  #   # return response["ok"]
  #
  #   url = BASE_URL + "chat.postMessage?" + "token=#{token}"
  #   response = HTTParty.post(url,
  #     body: {
  #       "text" => "#{text}",
  #       "channel" => "#{channel_id}",
  #       "username" => "MonkeyBot",
  #       "icon_emoji" => ":monkey:",
  #       "as_user" => "false"
  #     },
  #     headers: {'Content-Type' => 'application/x-www-form-urlencoded'}
  #     )
  #   return response["ok"]
  # end
  #
  def self.getRecipe(uri)
    url = "https://api.edamam.com/search?r=http://www.edamam.com/ontologies/edamam.owl_" + uri
    response = HTTParty.get(url)
    options = {
    label: response[0]["label"],
    image:  response[0]["image"],
    uri:  response[0]["uri"],
    ingredientlines: response[0]["ingredientLines"]
   }
    return Recipe.new(options)
  end


end
