class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :slug

  has_many :users
end
