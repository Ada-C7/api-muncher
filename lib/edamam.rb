class Edamam
  class Edamam < StandardError; end

  BASE_URL = "https://api.edamam.com/search?"

  attr_reader :search_item, :uri

  def initialize(search_item, uri)
    @search_item = search_item
    @uri = fix_uri
  end

  def self.all_search(search_item)
    query_params = {
      "q" => search_item,
      "id" => ENV["edamam_id"],
      "key" => ENV["edamam_key"]
    }
    response = HTTParty.get(BASE_URL, query: query_params).parsed_response
    return response["hits"]
  end

  def fix_uri
    uri.gsub('#', '%23')
  end

  def self.show_one_result(uri)
    query_params = {
      "r" => uri,
      "id" => ENV["edamam_id"],
      "key" => ENV["edamam_key"]
    }
    response = HTTParty.get(BASE_URL, query: query_params).parsed_response
    return response
  end
end
