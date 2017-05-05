# require 'httparty'

class EdamamRecipe

  class EdamamException < StandardError
  end

  BASE_URL_SEARCH = "https://api.edamam.com/search"
  BASE_URI_SEARCH = "http://www.edamam.com/ontologies/edamam.owl%23"

  attr_reader :uri, :label, :image

  def initialize(info_hash)
    @uri = info_hash[:uri]
    @label = info_hash[:label]
    @image = info_hash[:image]
  end
  
  def self.find(obj)
    found_obj = self.all.select { |object| object == obj}
    return found_obj.first # returns nil if for empty array
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.search(search_text, from = "0", to = "10")
    url = "#{BASE_URL_SEARCH}?q=#{search_text}&from=#{from}&to=#{to}&api_id=#{ENV["EDAMAM_APP_ID"]}&api_key=#{ENV["EDAMAM_APP_KEY"]}"
    response = HTTParty.get(url)
    recipes_array = []
    response["hits"].each do |recipe|
      if self.find(recipe["recipe"]["uri"]) == nil
        recipes_array << self.new({ uri:  recipe["recipe"]["uri"],  label:  recipe["recipe"]["label"] ,  image:  recipe["recipe"]["image"] })
      else
        recipes_array << self.find(recipe["recipe"]["uri"])
      end
    end
    return [recipes_array, response["count"]]
  end

  def self.show(uri)
    url = "#{BASE_URL_SEARCH}?r=#{BASE_URI_SEARCH}#{uri}&api_id=#{ENV["EDAMAM_APP_ID"]}&api_key=#{ENV["EDAMAM_APP_KEY"]}"
    response = HTTParty.get(url)
    return response
  end

end # END of class EdamamRecipe


# test1 = EdamamRecipe.new(uri: "uri", label: "this is the label", image: "soemthing")
# puts test1

# puts EdamamRecipe.new(uri: "uri_aha", label: "this is the label", image: "soemthing").uri


# def self.find(uri)
#   found_uri = self.all.select { |object| object.uri == uri}
#   return found_uri.first # returns nil if for empty array
# end
#
# def self.find(obj)
#   found_obj = self.all.select { |object| object == obj}
#   return found_obj.first # returns nil if for empty array
# end

# def self.all
#   ObjectSpace.each_object(self).to_a
# end
