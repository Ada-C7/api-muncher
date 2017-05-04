class Recipe
  attr_reader :name, :id, :image, :source, :url, :yield, :ingredientLines, :dietLabels, :healthLabels, :calories

  def initialize(name, uri, image, options={})
    @name = name
    @id = convert_uri_to_id(uri)
    @image = image
    @source = options[:source]
    @url = options[:url]
    @yield = options[:yield]
    @ingredientLines = options[:ingredientLines]
    @dietLabels = options[:dietLabels]
    @healthLabels = options[:healthLabels]
    @calories = options[:calories]
  end

  def convert_uri_to_id(uri)
    id = uri.match(/recipe_(.+)/)
    return id[1]
  end
end
