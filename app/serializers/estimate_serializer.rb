class EstimateSerializer < ActiveModel::Serializer
  attributes :id, :point
  belongs_to :user
end
