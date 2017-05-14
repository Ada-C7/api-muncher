BASE_URL = "https://api.edamam.com/search\?"
EDAMAM_ID = ENV["EDAMAM_ID"]
EDAMAM_KEY = ENV["EDAMAM_KEY"]

class EdamamApiWrapper
  attr_reader :all_recipes, :count

  def self.find_recipes(query, page)
    if page
      per_page = 10
      from = (page - 1) * per_page
      to = page * per_page

      query_params = {
        "q" => query,
        "id" => EDAMAM_ID,
        "app_key" => EDAMAM_KEY,
        "from" => from,
        "to" => to,
        "health" => "dairy-free",
      }

      response = HTTParty.get(BASE_URL, query: query_params).parsed_response
      recipe_collection = Array.new
      response["hits"].map { |recipe| recipe_collection << Recipe.new(recipe) }
      @count = response["count"]
      @all_recipes = recipe_collection
    else
      ArgumentError.new("invalid page")
    end
  end

  def self.find(index)
    @all_recipes[index.to_i]
  end
end
