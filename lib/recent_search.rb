class RecentSearch

  attr_reader :search_terms, :health

  def initialize(search_terms, health=nil)
    raise ArgumentError.new("Must have search_terms") if search_terms == nil
    @search_terms = search_terms
    @health = health
  end


end
