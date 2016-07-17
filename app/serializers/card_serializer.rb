class CardSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :type

  has_many :users
  belongs_to :project
end
