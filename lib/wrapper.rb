class Wrapper
     BASE_URL = "https://api.edamam.com/search?"
     RECIPE_URL = "http://www.edamam.com/ontologies/edamam.owl%23recipe"
     ID = ENV["EDAMAM_ID"]
     KEY = ENV["EDAMAM_KEY"]

     def self.listRecipes(filter)
          url = BASE_URL +
               "q=chocolate%26#{filter}" +
               "&app_id=#{ID}" +
               "&app_key=#{KEY}" +
               "&from=0" +
               "&to=100"

          response = HTTParty.get(url)

          recipes = []
          if response["hits"]
               response["hits"].each do |hit|
                    recipes << Recipe.new(
                    uri = hit["recipe"]["uri"],
                    id: hit["recipe"]["uri"][-33..-1],
                    name: hit["recipe"]["label"],
                    photo: hit["recipe"]["image"])
               end
          end
          return recipes
     end

     def self.getRecipe(id)
          url = BASE_URL +
               "r=" +
               RECIPE_URL +
               "#{id}" +
               "&app_id=#{ID}" +
               "&app_key=#{KEY}"

          response = HTTParty.get(url)

          if response
                    recipe = Recipe.new(
                    uri = response[0]["uri"],
                    id: id,
                    name: response[0]["label"],
                    photo: response[0]["image"],
                    ingredients: response[0]["ingredientLines"],
                    dietary_intel: response[0]["healthLabels"],
                    site: response[0]["source"],
                    directions:response[0]["url"])
          end
          return recipe
     end
end
