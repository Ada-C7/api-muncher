class Recipe

  attr_reader :label, :image, :uri, :url, :ingredients, :diet

  BASE_URL = "https://api.edamam.com/search?"

  def initialize(label, image, uri, url, ingredients, diet)
    @label = label
    @image = image
    @uri = uri
    @url = url
    @ingredients = ingredients
    @diet = diet
  end

  def self.search(search_term, page_params)
    to_recipe = page_params.to_i * 10
    from_recipe = to_recipe - 10

    url = "#{BASE_URL}app_key=#{ENV['APP_KEY']}&app_id=#{ENV['APP_ID']}&q=#{search_term}&from=#{from_recipe}&to=#{to_recipe}"

    response = HTTParty.get(url).parsed_response

    recipes_list = []

    if response['count'] == 0
      return []
    else
      10.times do |count|
        recipe = Recipe.from_hash(response['hits'][count]['recipe'].symbolize_keys)
        recipes_list << recipe
      end
    end
    return recipes_list
  end

  def self.show_recipe(uri)
    url = "#{BASE_URL}app_key=#{ENV['APP_KEY']}&app_id=#{ENV['APP_ID']}&r=http://www.edamam.com/ontologies/edamam.owl%23#{uri[1..-1]}"

    response = HTTParty.get(url).parsed_response

    if response.empty?
      return nil
    end

    Recipe.from_hash(response[0].symbolize_keys)
  end

  def self.from_hash(hash)
    Recipe.new(
    hash[:label],
    hash[:image],
    hash[:uri],
    hash[:url],
    hash[:ingredientLines],
    hash[:dietLabels]
    )
  end

end
