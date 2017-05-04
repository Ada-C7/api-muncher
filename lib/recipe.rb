class Recipe
  attr_reader :name, :url, :ingredients, :diet_info

  def initialize(params)
    @name = params[:name]
    @url = params[:url]
    @ingredients = params[:ingredients]
    @diet_info = params[:diet_info]
  end
end
