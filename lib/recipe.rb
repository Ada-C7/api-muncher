#class that will work like a model; doesn't talk to the db so not a model


class Recipe
  attr_reader :name, :id, :purpose, :is_archived, :members

  def initialize(title, url, options = {})
    raise ArgumentError if name == nil || name == "" || id == nil || id == ""

    @name = name
    @id = id


    @purpose = options[:purpose]
    @is_archived = options[:is_archived]
    @is_general = options[:is_general]
    @members = options[:members]


  end

end
