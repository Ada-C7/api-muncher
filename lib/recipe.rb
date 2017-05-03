class Recipe
  attr_reader :name, :id, :image, :source, :url, :yield, :ingredientLines, :dietLabels, :healthLabels, :calories

  def initialize(name, id, image, options={})
    @name = name
    @id = id
    @image = image

    @source = options[:source]
    @url = options[:url]
    @yield = options[:yield]
    @ingredientLines = options[:ingredientLines]
    @dietLabels = options[:dietLabels]
    @healthLabels = options[:healthLabels]
    @calories = options[:calories]
  end
end
