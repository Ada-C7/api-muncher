class EdamamRecipe
  class EdamamException < RuntimeError
  end

  BASE_URL = "https://api.edamam.com/search

  ?app_id=8eae3d45&app_key=e81c11f2fbf36d24cbcfe0bd7c650bab"

  attr_reader :search_text

  def initialize(seach_info)
    @search_text = search_info[:search_term]
    # health = search_hash[:health_options]
    # diet = search_hash[:diet_options]
  end

  # can send search info through initialize and use this method
  # with instance variables - or send search results staright to this method
  def get_search_results
    query_params = {
                    "app_id" => ENV["EDAMAM_ID"],
                    "app_key" => ENV["EDAMA_KEY"],
                    "q" => @search_text,
                    # "Diet" => "",
                    # "Health" => ""
                   }
    url = "#{BASE_URL}"
    response = HTTParty.get(url, query: query_params)

    if response["ok"]
      return response
    else
      raise EdamamException.new(response["error"])
    end
  end
end
