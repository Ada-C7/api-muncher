class User < ApplicationRecord
  has_many :recipes
  has_many :searches

  validates :provider, presence: true
  validates :uid, presence: true, uniqueness: true


end
