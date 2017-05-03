require 'httparty'


class EdamamApi

BASE_URL = "https://api.edamam.com/search?"

# attr_reader :search
#
# def initialize(search)
#   @search = search
# end

def self.list_recipes(query)
  query_params = {
    "app_id" => ENV["APP_ID_SENSITIVE"],
    "app_key" => ENV["API_KEY_SENSITIVE"],
    "q" => query
  }
  url = "#{BASE_URL}"
  response = HTTParty.get(url, query: query_params)
  return response
end

# https://api.edamam.com/search?app_id=feefc454&app_key=745ad1a334a7a0a4f6a05f2bbdc52846&from=0&to=1&q=apple


end
