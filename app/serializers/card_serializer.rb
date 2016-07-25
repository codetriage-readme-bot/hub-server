class CardSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :type, :project_id, :slug

  has_many :users
  belongs_to :project
end
