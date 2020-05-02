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
require 'rails_helper'

RSpec.describe Estimate, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
