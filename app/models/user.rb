class User < ApplicationRecord
  has_many :recipes
  def self.build_from_google(auth_hash)
  user = User.new
  user.uid   = auth_hash["uid"]
  user.provider = 'google'
  user.name  = auth_hash["info"]["name"]
  user.email = auth_hash["info"]["email"]
  user.save
  return user
end

end
