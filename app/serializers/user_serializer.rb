class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :slug

  has_many :cards
  has_many :projects
end
