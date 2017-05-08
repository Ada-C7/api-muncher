

class EdamamRecipe

  class EdamamException < StandardError
  end

  BASE_URL_SEARCH = "https://api.edamam.com/search"
  BASE_URI_SEARCH = "http://www.edamam.com/ontologies/edamam.owl%23"

  attr_reader :uri, :label, :image

  def initialize(info_hash)
    unless info_hash.include? :uri
      raise ArgumentError.new("Missing parameter")
    end
    @uri = info_hash[:uri]
    @label = info_hash[:label]
    @image = info_hash[:image]
  end

  def self.search(search_text = "recipe", from = "0", to = "10")
    url = "#{BASE_URL_SEARCH}?q=#{search_text}&from=#{from}&to=#{to}&api_id=#{ENV["EDAMAM_APP_ID"]}&api_key=#{ENV["EDAMAM_APP_KEY"]}"
    response = HTTParty.get(url)
    recipes_array = []
    if response["count"] == nil || response["count"] == 0
      return [[], 0]
    else
      response["hits"].each do |recipe|
        recipes_array << self.new({ uri:  recipe["recipe"]["uri"],  label:  recipe["recipe"]["label"] ,  image:  recipe["recipe"]["image"] })
      end
      return [recipes_array, response["count"]]
    end
  end

  def self.show(uri)
    url = "#{BASE_URL_SEARCH}?r=#{BASE_URI_SEARCH}#{uri}&api_id=#{ENV["EDAMAM_APP_ID"]}&api_key=#{ENV["EDAMAM_APP_KEY"]}"
    response = HTTParty.get(url)
    return response
  end

end # END of class EdamamRecipe
