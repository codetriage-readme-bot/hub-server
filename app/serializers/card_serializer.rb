class CardSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :type, :project_id, :slug, :status, :created_at

  has_many :users
  belongs_to :project
end
