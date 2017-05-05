class Recipe

  attr_reader :label, :uri, :image, :ingredientlines, :url, :totalnutrients

  def initialize(options)
    @label = options[:label]
    @image =  options[:image]
    @uri = options[:uri]
    @ingredientlines = options[:ingredientlines]
    @url = options[:url]
    @totalnutrients = options[:totalnutrients]
    raise ArgumentError if @label == nil || @label == ""
    # @channel_options = options

  #   @purpose = options[:purpose]
  #   @is_archived = options[:is_archived]
  #   @is_general = options[:is_general]
  #   @members = options[:members]
  end

end
