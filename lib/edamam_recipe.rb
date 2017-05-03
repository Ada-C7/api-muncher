class EdamamRecipe

  class EdamamException < StandardError
  end

  BASE_URL_SEARCH = "https://api.edamam.com/search"

  attr_reader :uri, :label, :image

  def initialize(info_hash)
    @uri = info_hash[:uri]
    @label = nfo_hash[:label]
    @image = nfo_hash[:image]
  end

  def self.search(search_text)
    url = "#{BASE_URL_SEARCH}?q=#{search_text}&api_id=#{ENV["EDAMAM_APP_ID"]}&api_key=#{ENV[EDAMAM_APP_KEY]}"
    response = HTTParty.get(url)
    recipes_array = []
    response["hits"].each do |recipe|
      if self.find(recipe["recipe"]["uri"]) == nil
        recipes_array << self.new({ uri:  recipe["recipe"]["uri"],  label:  recipe["recipe"]["label"] ,  image:  recipe["recipe"]["image"] })
      else
        recipes_array << self.find(recipe["recipe"]["uri"])
      end
    end
    return recipes_array
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.find(uri)
    found_uri = self.all.select { |object| object.uri == uri}
    return found_uri.first # returns nil if for empty array
  end

  def show
    uri = @uri.gsub("#","%23")
    url = "#{BASE_URL_SEARCH}?r=#{uri}&api_id=#{ENV["EDAMAM_APP_ID"]}&api_key=#{ENV[EDAMAM_APP_KEY]}"
    response = HTTParty.get(url)
    return response
  end

end # END of class EdamamRecipe
