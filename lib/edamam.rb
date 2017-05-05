class Edamam
  class Edamem < StandardError; end

  BASE_URL = "https://api.edamam.com/search?"

  def search(search_item)
    query_params = {
      "q" => search_item,
      "id" => ENV["edamam_id"],
      "key" => ENV["edamam_key"]
    }
    response = HTTParty.post(BASE_URL, query: query_params).parsed_response

    response["hits"]

  end
end
