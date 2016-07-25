class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :slug

  has_many :cards
  has_many :users
end
