class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :slug, :status, :created_at

  has_many :cards
  has_many :users
end
