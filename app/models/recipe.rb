class Recipe < ApplicationRecord
  attr_reader :uri, :label, :url, :image, :ingredients, :dietary, :yield, :source, :calories

  def initialize(recipe)
    @uri = recipe["recipe"]["uri"]
    @label = recipe["recipe"]["label"]
    @url = recipe["recipe"]["shareAs"]
    @image = recipe["recipe"]["image"]
    @ingredients = recipe["recipe"]["ingredientLines"]
    @dietary = recipe["recipe"]["healthLabels"]
    @yield = recipe["recipe"]["yield"]
    @source = recipe["recipe"]["source"]
    @calories = recipe["recipe"]["calories"].to_i
  end
end
