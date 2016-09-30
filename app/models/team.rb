class Team < ApplicationRecord
  has_and_belongs_to_many :users

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      :name
    ]
  end
end
