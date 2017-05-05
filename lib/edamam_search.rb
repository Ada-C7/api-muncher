require 'httparty'
require_relative 'recipe'

class EdamamSearch
  class EdamamException < RuntimeError
  end

  BASE_URL = "https://api.edamam.com/search?"

  attr_reader :search_text, :to, :from, :recipe_id, :health, :diet

  def initialize(search_params)
    @search_text = search_params[:search_text]
    @to = search_params[:to]
    @from = search_params[:from]
    @recipe_id = search_params[:recipe_id]
    @health = search_params[:health].join(", ") if search_params[:health]
    @diet = search_params[:diet].join(", ") if search_params[:diet]

    # diet = search_hash[:diet_options]
  end

  def search_results

    query_params = {
                    "app_id" => ENV["EDAMAM_ID"],
                    "app_key" => ENV["EDAMAM_KEY"],
                    "q" => "#{@search_text}",
                    "to" => "#{@to}",
                    "from" => "#{@from}",
                    "health" => "#{@health}",
                    "diet" => "#{@diet}",
                    "r" => "http://www.edamam.com/ontologies/edamam.owl%23recipe#{@recipe_id}"
                   }

    query_params = query_params.delete_if { |key, value| value.nil? || value.empty? || ( key == "r" && @recipe_id.nil?) }

    p query_params

    # response = HTTParty.get("https://api.edamam.com/search?app_id=#{ENV["EDAMAM_ID"]}&app_key=#{ENV["EDAMAM_KEY"]}&q=#{@search_text}")
    url = "#{BASE_URL}"
    response = HTTParty.get(url, query: query_params)
    # raise
    if response.parsed_response.empty?
      raise EdamamException.new("No results for that search")
    elsif response.count == 1
      return response[0]
    elsif response["hits"]
      return response["hits"]
    end
    #
    # if response.count == 1
    #   return Recipe.individual_recipe(response[0])
    # elsif response["count"]
    #   return Recipe.list_of_recipes(response["hits"])
    # elsif response["error"]
    #   raise EdamamException.new(response["error"])
    # end
  end
end
