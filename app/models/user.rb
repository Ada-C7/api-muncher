class User < ApplicationRecord
  def self.from_omniauth(auth)
    # user = User.new
    # user.name = auth_hash["info"]["name"]
    # user.email = auth_hash["info"]["email"]
    # user.oauth_id = auth_hash["uid"]
    # user.oauth_provider = "github"
    # return user
   where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
     user.provider = auth.provider
     user.uid = auth.uid
     user.name = auth.info.name
     user.oauth_token = auth.credentials.token
     user.oauth_expires_at = Time.at(auth.credentials.expires_at)
     return user
   end
 end
end
