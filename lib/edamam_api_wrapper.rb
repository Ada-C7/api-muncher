require 'httparty'

class EdamamApiWrapper
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]
  BASE_URL = "https://api.edamam.com/search?app_id=#{APP_ID}&app_key=#{APP_KEY}"

  def self.get_recipes(search_term, page)
    to, from = page_to_pages(page)

    url = "#{BASE_URL}&q=#{search_term}&to=#{to}&from=#{from}"
    results = HTTParty.get(url)

    Recipe.create_multiple_from_edamam(results["hits"])
  end

  def self.find_by_uri(uri)
    url = "#{BASE_URL}&r=#{uri}"
    results = HTTParty.get(url)

    Recipe.create_from_edamam(results.first)
  end

  private
  def self.page_to_pages(page)
    to = page * 10
    from = to - 9

    [to, from]
  end
end
