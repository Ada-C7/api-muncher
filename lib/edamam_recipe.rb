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

    def find(page, filter = nil)
        from_num = (page * 10) - 10
        to_num = (page * 10) - 1
        diet_labels = ['balanced', 'high-protein', 'high-fiber', 'low-fat', 'low-carb', 'low-sodium']

        query_params = {
            'app_id' => ID,
            'app_key' => TOKEN,
            'from' => from_num,
            'to' => to_num
        }

        url = "#{BASE_URL}?q=#{@search_term}"

        unless filter.nil?
            filter.each do |label|
                url += if diet_labels.include? label
                           "&diet=#{label}"
                       else
                           "&health=#{label}"
                       end
            end
        end

        begin
            response = HTTParty.get(url, query: query_params)
        rescue
            response = {}
            response['hits'] = []
        end

        response['hits']
    end

    def self.show(uri)
        query_params = {
            'app_id' => ID,
            'app_key' => TOKEN,
            'r' => uri
        }

        response = HTTParty.get(BASE_URL, query: query_params)
    end
end
