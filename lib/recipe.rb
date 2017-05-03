# https://api.edamam.com/search?
#
# https://api.edamam.com/search?app_key=blah&app_id=blah&q=lasagna&health=peanut-free

class Recipe
  class RecipeException < StandardError
  end

  BASE_URL = "https://api.edamam.com/search?"

  # attr_reader :search_term, :health, :diet

  def initialize
    # @search_term = search_term
  end

  def send_search(key_word)
    query_params = {
      "app_id" => ENV["App_ID"],
      "app_key" => ENV["App_Key"],
      "q" => key_word
    }
    response = HTTParty.get(BASE_URL, query: query_params)
  end
end



# class SlackChannel
#   class SlackException < StandardError
#   end
#
#   BASE_URL = "https://slack.com/api/"
#
#   attr_reader :name
#
#   def initialize(name)
#     @name = name
#   end
#
#   def send(message)
#     query_params = {
#       "token" => ENV["SLACK_API_TOKEN"],
#       "channel" => @name,
#       "text" => message,
#       "username" => "twins",
#       "icon_emoji" => ":slam:",
#       "as_user" => false
#
#     }
  #   url = "#{BASE_URL}chat.postMessage"
  #   response = HTTParty.post(url, query: query_params)
  #   if response["ok"]
  #     puts "Everything went swell"
  #   else
  #     raise SlackException.new(response["error"])
  #   end
  #   #do someting with the response?
  # end

  # def self.all
  #   url = "#{BASE_URL}channels.list?token=#{ENV["SLACK_API_TOKEN"]}&channel=#{name}&icon_url=http://icons.iconarchive.com/icons/wackypixel/dogs-n-puppies/128/Puppy-10-icon.png"
  #   response = HTTParty.get(url).parsed_response
  #
  #   if response["ok"]
  #     channel_list = response["channels"].map do |channel_data|
  #     self.new(channel_data["name"])
  #     end
  #     return channel_list
  #   else
  #     raise SlackException.new(response["error"])
  #   end
  #
  # end
# end
