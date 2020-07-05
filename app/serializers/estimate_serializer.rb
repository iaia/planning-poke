class EstimateSerializer < ActiveModel::Serializer
  attributes :id, :point
  belongs_to :user

  def point
    if object.issue.done
      object.point
    else
      '?'
    end
  end
end
