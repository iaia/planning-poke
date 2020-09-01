# == Schema Information
#
# Table name: estimates
#
#  id         :bigint           not null, primary key
#  point      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  issue_id   :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_estimates_on_issue_id  (issue_id)
#  index_estimates_on_user_id   (user_id)
#
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
