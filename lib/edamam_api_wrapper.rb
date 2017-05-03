require 'httparty'
require 'recipe'


class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.listRecipes(search_words)
    # https://api.edamam.com/search?q=chicken&app_id=06e21391&app_key=a3c24327c4ec34b54f1230f61ed67379
  #  url = "https://api.edamam.com/search?q=chicken&app_id=06e21391&app_key=a3c24327c4ec34b54f1230f61ed67379"
  #         https://api.edamam.com/search?q=chicken&app_id=06e21391&app_key=a3c24327c4ec34b54f1230f61ed67379


   url = BASE_URL + "?q=#{ search_words }" + "&app_id=#{ APP_ID }" + "&app_key=#{ APP_KEY }"
   response = HTTParty.get(url)

   @recipes = []


  #  puts "hits 0************** #{response["hits"]}*********"
  if response["hits"]
   response["hits"].each do | hit |
     label = hit["recipe"]["label"]
    #  label = hit[i]["recipe"]["label"]
     @recipes << Recipe.new(label)
    #  puts recipes

    end
    puts @recipes
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
  # def self.getChannel(channel_id)
  #   url = BASE_URL + "channels.info?" + "token=#{TOKEN}&" + "channel=#{channel_id}"
  #   response = HTTParty.get(url)
  #
  #   return Channel.new(response["channel"]["name"], response["channel"]["id"])
  # end


end
