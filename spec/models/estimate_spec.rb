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
  describe '.create' do
    context 'valid params' do
      let(:user) do
        create(:user)
      end
      let(:issue) do
        create(:issue)
      end
      let(:params) do
        {
          point: 1,
          user_id: user.id,
          issue_id: issue.id
        }
      end

      it '' do
        estimate = Estimate.new(params)
        expect(estimate).to be_valid
        estimate.save!
        expect(estimate.point).to eq 1
        expect(estimate.user).to eq user
        expect(estimate.issue).to eq issue
      end
    end
  end
end
