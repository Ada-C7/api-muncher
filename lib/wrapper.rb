class Wrapper
     BASE_URL = "https://api.edamam.com/search?"
     ID = ENV["EDAMAM_ID"]
     KEY = ENV["EDAMAM_KEY"]

     def self.listRecipes
          url = BASE_URL +
               "q=chocolate" +
               "&app_id=#{ID}" +
               "&app_key=#{KEY}"

          response = HTTParty.get(url)

          recipes = []
          if response["hits"]
               response["hits"].each do |hit|
                    recipes << Recipe.new(
                    uri: hit["recipe"]["uri"],
                    name: hit["recipe"]["label"],
                    photo: hit["recipe"]["image"])
               end
          end
          return recipes
     end
end
