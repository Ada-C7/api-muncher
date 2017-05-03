require 'httparty'

class EdmamApiWrapper
  BASE_URL = "https://api.edamam.com"
  TOKEN = ENV["EDMAM_TOKEN"]
end
