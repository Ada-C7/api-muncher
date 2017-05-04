require 'httparty'
class EdamamSearch
  class EdamamException < RuntimeError
  end

  BASE_URL = "https://api.edamam.com/search?"

  attr_reader :search_text, :to, :from, :recipe_id

  def initialize(search_params)
    @search_text = search_params[:search_text]
    @to = search_params[:to]
    @from = search_params[:from]
    @recipe_id = search_params[:recipe_id]
    # health = search_hash[:health_options]
    # diet = search_hash[:diet_options]
  end

  def search_results
    query_params = {
                    "app_id" => ENV["EDAMAM_ID"],
                    "app_key" => ENV["EDAMAM_KEY"],
                    "q" => "#{@search_text}",
                    "to" => "#{@to}",
                    "from" => "#{@from}",
                    "r" => "http://www.edamam.com/ontologies/edamam.owl%23recipe_#{@recipe_id}"
                   }

    query_params = query_params.delete_if { |key, value| value.empty? || ( key == "r" && @recipe_id.nil?) }


    # p query_params
    # raise
    # response = HTTParty.get("https://api.edamam.com/search?app_id=#{ENV["EDAMAM_ID"]}&app_key=#{ENV["EDAMAM_KEY"]}&q=#{@search_text}")
    url = "#{BASE_URL}"
    response = HTTParty.get(url, query: query_params)

    if response.count == 1
      return wanted_recipe_info(response)
    elsif response["count"] > 0
      return labels_and_images(response)
    elsif response["error"]
      raise EdamamException.new(response["error"])
    end
  end

private
  def labels_and_images(response)
    results = response["hits"].map do |info|
      recipe = Hash.new
      recipe[:id] = info["recipe"]["uri"].gsub("#", "%23")[53..-1]
      recipe[:label] = info["recipe"]["label"]
      recipe[:image_url] = info["recipe"]["image"]
      recipe
    end
    return results
  end

  def wanted_recipe_info(response)
    recipe = Hash.new
    recipe[:label] = response[0]["label"]
    recipe[:image_url] = response[0]["image"]
    recipe[:original_recipe] = response[0]["url"]
    # you want ingredientLines
    recipe[:ingredients] = response[0]["ingredientLines"]
    recipe[:ingredients2] = response[0]["ingredients"]
    recipe[:dietary_information] = response[0]["totalNutrients"]
    recipe
  end
end
