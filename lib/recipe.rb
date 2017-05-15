class Recipe
     attr_reader :uri, :id, :name, :photo, :ingredients, :dietary_intel, :site, :directions

      def initialize(uri, options = {} )
           @uri = uri
           @id = options[:id]
           @name = options[:name]
           @photo = options[:photo]
           @ingredients = options[:ingredients]
           @dietary_intel = options[:dietary_intel]
           @site = options[:site]
           @directions = options[:directions]
      end
end
