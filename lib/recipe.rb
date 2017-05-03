class Recipe
  attr_reader :label, :uri, :img_url
  def initialize(label, uri, img_url)
    raise ArgumentError if label == nil || label == "" || uri == nil || uri == "" || img_url == nil || img_url == ""
      @label = label
      @uri = uri
      @img_url = img_url
  end
end
