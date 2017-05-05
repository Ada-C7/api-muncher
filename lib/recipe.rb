require 'json'

class Recipe

  attr_reader :label, :image, :uri

  def initialize(label, image, uri)
    @label = label
    @image = image
    @uri = uri
  end

  def self.search(search_term)
    ##NOTE: HARD CODE NUM OF RETURNS ON END (TO=)
    url = "https://api.edamam.com/search?app_key=#{ENV['APP_KEY']}&app_id=#{ENV['APP_ID']}&q=#{search_term}&to=10"

    response = HTTParty.get(url).parsed_response

    recipes_list = []

    # Working, but loop needs to be DRYed
    ## LOok up for specific api -- may have documentation
    10.times do |count|
      label = response['hits'][count]['recipe']['label']
      image = response['hits'][count]['recipe']['image']
      uri = response['hits'][count]['recipe']['url']

      recipes_list << Recipe.new(label, image, uri)
    end

    # raise

    return recipes_list#recipe_display
  end

  def list_display
    ##LOGIC FOR LIST DISPLAY
  end

end
