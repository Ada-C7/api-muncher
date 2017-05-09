class Result

  attr_reader :recipe_label, :uri, :image

  def initialize(results)
    @recipe_label = results["label"]
    @uri = results["uri"]
    @image = results["image"]
  end

end
