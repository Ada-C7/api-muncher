class Search < ApplicationRecord
  belongs_to :user

  def set_up_search(vegan, kosher, vegetarian, paleo)
    vegan== nil ? self.vegan = false : self.vegan = true
    kosher == nil ? self.kosher = false : self.kosher = true
    vegetarian == nil ? self.vegetarian = false : self.vegetarian = true
    paleo == nil ? self.paleo = false : self.paleo = true
  end

end
