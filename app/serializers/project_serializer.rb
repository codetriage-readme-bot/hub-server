class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description

  # has_many :cards
  # has_many :users
end
