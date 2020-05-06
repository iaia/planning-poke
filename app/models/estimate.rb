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
class Estimate < ApplicationRecord
  belongs_to :issue
  belongs_to :user

  # TODO: issue_idとuser_idでunique index張る

  class << self
    def create_or_find_by_issue_id(current_user, issue_id, point)
      estimate = current_user.estimates.find_by(issue_id: issue_id)
      estimate ||= current_user.estimates.create(issue_id: issue_id, point: point)
      estimate
    end
  end
end
