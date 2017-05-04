require 'httparty'
class EdamamSearch
  class EdamamException < RuntimeError
  end

  BASE_URL = "https://api.edamam.com/search?"

  attr_reader :search_text, :to, :from

  def initialize(search_params)
    @search_text = search_params[:search_text]
    @to = search_params[:to]
    @from = search_params[:from]
    # @to = 0
    # @from =
    # health = search_hash[:health_options]
    # diet = search_hash[:diet_options]
  end

  def search_results

    query_params = {
                    "app_id" => ENV["EDAMAM_ID"],
                    "app_key" => ENV["EDAMAM_KEY"],
                    "q" => @search_text,
                    "to" => "#{@to}",
                    "from" => "#{@from}"
                    # "Diet" => "",
                    # "Health" => ""
                   }

    # response = HTTParty.get("https://api.edamam.com/search?app_id=#{ENV["EDAMAM_ID"]}&app_key=#{ENV["EDAMAM_KEY"]}&q=#{@search_text}")
    url = "#{BASE_URL}"
    response = HTTParty.get(url, query: query_params)
    # raise
    if response["count"] > 0
      return labels_and_images(response)
    elsif response["error"]
      raise EdamamException.new(response["error"])
    end
  end

private

  def labels_and_images(response)
    results = response["hits"].map do |info|
      recipe = Hash.new
      recipe[:uri] = info["recipe"]["uri"]
      recipe[:label] = info["recipe"]["label"]
      recipe[:image_url] = info["recipe"]["image"]
      recipe
    end
    return results
  end
end
