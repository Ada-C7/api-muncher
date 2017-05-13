class Search < ApplicationRecord
  belongs_to :user

  def set_up_search(health)
    health.each do |option|
      if option == "vegan"
        self.vegan = true
      elsif  option == "tree-nut-free"
        self.treenutfree = true
      elsif  option == "peanut-free"
        self.peanutfree = true
      elsif  option == "vegetarian"
        self.vegetarian = true
      end
    end
  end

end
