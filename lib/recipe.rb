require 'json'

class Recipe

  attr_reader :label, :image, :url, :ingredient_lines, :diet_labels

  def initialize(label, image, url, ingredient_lines, diet_labels)
    @label = label
    @image = image
    @url = url
    @ingredient_lines = ingredient_lines
    @diet_labels = diet_labels
  end

  def self.search(search_term)
    ##NOTE: HARD CODE NUM OF RETURNS ON END (TO=)
    url = "https://api.edamam.com/search?app_key=#{ENV['APP_KEY']}&app_id=#{ENV['APP_ID']}&q=#{search_term}&to=10"

    response = HTTParty.get(url).parsed_response


    recipes_list = []

    # Working, but loop needs to be DRYed
    count = 0
    10.times do
      label = response['hits'][count]['recipe']['label']
      image = response['hits'][count]['recipe']['image']
      url = response['hits'][count]['recipe']['url']
      ingredient_lines = response['hits'][count]['recipe']['ingredientLines']
      diet_labels = response['hits'][count]['recipe']['dietLabels']

      recipes_list << Recipe.new(label, image, url, ingredient_lines, diet_labels)
      count += 1
    end

    # raise

    return recipes_list#recipe_display
  end

  def list_display
    ##LOGIC FOR LIST DISPLAY
  end

end
