class User < ActiveRecord::Base
  has_and_belongs_to_many :cards
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :teams

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      :name
    ]
  end
end
