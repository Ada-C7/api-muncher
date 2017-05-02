require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  APP_ID = ENV["APP_ID"]
  APP_ID = ENV["APP_KEY"]

  def self.search(search_term, app_id = nil, app_key = nil)
    app_id ||= APP_ID
    app_key ||= APP_KEY

    # url = BASE_URL + "chat.postMessage?" + "token=#{ token }"
    #
    # response = HTTParty.post(url,
    # body: {
    #   "text" => "#{ text }",
    #   "channel" => "#{ channel_id }",
    #   "as_user" => "true"
    # },
    # headers: {
    #   "Content-Type" => "application/x-www-form-urlencoded"
    # }
    # )

    # return response["ok"]
  end

  def self.listRecipes(search_term, app_id = nil, app_key = nil)
    app_id ||= APP_ID
    app_key ||= APP_KEY

    # url = BASE_URL + "channels.list?" + "token=#{ token }"
    #
    # response = HTTParty.get(url)
    #
    # channels = []
    # if response["channels"]
    #   response["channels"].each do |channel|
    #     id = channel["id"]
    #     name = channel["name"]
    #     channels << Channel.new(name, id)
    #   end
    # end
    #
    # return channels
  end

  def self.showRecipe(id)
    # url = BASE_URL + "channels.info?" + "token=#{ TOKEN }&" + "channel=#{ id }"
    #
    # response = HTTParty.get(url)
    #
    # if response["channel"]
    #   return Channel.new(response["channel"]["name"], response["channel"]["id"])
    # else
    #   return false
    # end
  end
end
