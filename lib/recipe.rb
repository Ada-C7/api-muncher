class Recipe
     attr_reader :uri, :id, :name, :photo, :ingredients, :dietary_intel, :source, :directions_url

      def initialize(options = {} )
           @uri = options[:uri]
           @id = options[:id]
           @name = options[:name]
           @photo = options[:photo]
           @ingredients = options[:ingredients]
           @dietary_intel = options[:dietary_intel]
           @site = options[:source]
           @directions = options[:directions_url]
      end
end
