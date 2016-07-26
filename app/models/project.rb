class Project < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :cards

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      :title
    ]
  end
end
