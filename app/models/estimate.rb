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

  class << self
    def create_or_find_by_issue_id(current_user, estimate_params)
      estimate = current_user.estimates.find_by(issue_id: estimate_params[:issue_id])
      estimate ||= current_user.estimates.create(estimate_params)
      estimate
    end
  end
end
