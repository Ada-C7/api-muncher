require 'httparty'

class EdamamRecipe
    class EdamamException < StandardError
    end

    BASE_URL = 'https://api.edamam.com/search'.freeze
    TOKEN = ENV['EDAMAM_TOKEN']
    ID = ENV['EDAMAM_ID']

    attr_reader :search_term

    def initialize(search_term)
        @search_term = search_term
    end

    def find
        query_params = {
            'app_id' => ID,
            'app_key' => TOKEN
        }

        url = "#{BASE_URL}?q=#{@search_term}"
        response = HTTParty.get(url, query: query_params)

        response['hits']
    end
end
