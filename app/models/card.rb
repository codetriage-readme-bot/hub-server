class Card < ActiveRecord::Base
  self.inheritance_column = :_type_disabled

  has_and_belongs_to_many :users
  belongs_to :project

  extend FriendlyId
  friendly_id :title, use: :slugged
end
