class User < ApplicationRecord
  has_many :recipes
  has_many :searches



  def self.build_from_google(auth_hash)
    user = User.new
    user.uid   = auth_hash["uid"]
    user.provider = 'google'
    user.name  = auth_hash["info"]["name"]
    user.email = auth_hash["info"]["email"]
    user.save
    return user
  end

  def alreary_in_favorite?(recipe)
    self.recipes.each do |rec|
      return true if rec.recipe_uri == recipe.uri
    end
    return false
  end

end
