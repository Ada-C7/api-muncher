class Recipe
  class RecipeException < StandardError
  end

  def self.all
    url = "#{BASE_URL}channels.list?token=#{TOKEN}"
    response = HTTParty.get(url).parsed_response
    if response["ok"]
      channel_list = response["channels"].map do |channel_data|
        self.new(channel_data)
      end

      return channel_list
    else
      raise SlackException.new(response["error"])
    end
  end
  
end
