class Recipe
    #add more stuff later
    attr_reader :name, :image, :uri, :ingredients, :link, :health_labels

    def initialize(name, image, uri, options = {})
        @name = name
        @image = image
        @uri = URI.escape(uri)
        @ingredients = options[:ingredients]
        @link = options[:link]
        @health_labels = options[:health_labels]
    end
end
