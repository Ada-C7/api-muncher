class Search < ApplicationRecord
  belongs_to :user

  validates :search_terms, presence: true
  validates :user_id, presence: true

  def has_health?
    if self.health != nil
      return "(#{self.health})"
    else
      return ""
    end
  end
end
