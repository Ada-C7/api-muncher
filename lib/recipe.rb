class Recipe


  attr_reader :name, :image, :uri, :options

  def initialize(name, image, uri, options = { }  )
    raise ArgumentError if name == nil || name == "" || image == nil || image == "" || uri == nil || uri == ""


    @name = name
    @image = image
    @uri = uri
    @options = options

  end

end
