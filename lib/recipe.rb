class Recipe

  attr_reader :label

  def initialize(label)
    raise ArgumentError if label == nil || label == ""
    @label = label

    # @channel_options = options

  #   @purpose = options[:purpose]
  #   @is_archived = options[:is_archived]
  #   @is_general = options[:is_general]
  #   @members = options[:members]
  #
  end

end
