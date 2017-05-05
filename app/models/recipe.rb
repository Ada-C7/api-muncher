class Recipe < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :recipe_url, presence: true
  validates :name, presence: true

end
