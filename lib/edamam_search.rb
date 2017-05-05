require 'httparty'
require_relative 'recipe'

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
    @health = search_params[:health_options]
    # diet = search_hash[:diet_options]
  end

  def search_results
    query_params = {
                    "app_id" => ENV["EDAMAM_ID"],
                    "app_key" => ENV["EDAMAM_KEY"],
                    "q" => "#{@search_text}",
                    "to" => "#{@to}",
                    "from" => "#{@from}",
                    "Health" => "#{@health}",
                    "r" => "http://www.edamam.com/ontologies/edamam.owl%23recipe#{@recipe_id}"
                   }

    query_params = query_params.delete_if { |key, value| value.empty? || ( key == "r" && @recipe_id.nil?) }

    # response = HTTParty.get("https://api.edamam.com/search?app_id=#{ENV["EDAMAM_ID"]}&app_key=#{ENV["EDAMAM_KEY"]}&q=#{@search_text}")
    url = "#{BASE_URL}"
    response = HTTParty.get(url, query: query_params)
    # p response
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
