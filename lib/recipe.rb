class Recipe


  def initialize

  end

  def self.search(search_term)
    #Basic functionality for method
    url = "https://api.edamam.com/search?app_key=#{ENV['APP_KEY']}&app_id=#{ENV['APP_ID']}&q=#{search_term}"

    response = HTTParty.get(url).parsed_response

    return response
  end

  def list_display
    ##LOGIC FOR LIST DISPLAY
  end

end
