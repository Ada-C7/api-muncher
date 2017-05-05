class Search < ApplicationRecord
  belongs_to :user

  validates :search_terms, presence: true
  validates :user_id, presence: true


end
