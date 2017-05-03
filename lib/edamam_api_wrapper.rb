require `httparty`

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?q="
  ID = ENV["APP_ID"]
  KEY = ENV["APP_KEY"]

  # method to get recipes matching search query
  def self.getRecipes(q)
    url = BASE_URL + "#{q}" + "&app_id=" + ID + "&app_key=" + KEY

    response = HTTParty.get(url)

    recipes = []
    if response["hits"]
      response["hits"].each do |result|
        name = response["hits"]
        link = response["hits"]
        ingredients = response["hits"]
        diet = response["hits"]
        recipes << Recipe.new(name, link, ingredients, diet)
      end
    end
    return recipes
  end
end

# https://api.edamam.com/search?q=chicken&app_id=55a70abd&app_key=417be177f9bad40a98293f98eb55690f&from=0&to=3&calories=gte%20591,%20lte%20722&health=alcohol-free
