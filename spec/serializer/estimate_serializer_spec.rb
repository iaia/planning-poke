require 'rails_helper'

RSpec.describe EstimateSerializer, type: :serializer do
  describe 'render' do
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
      let(:estimate) do
        Estimate.create!(params)
      end
      let(:json) do
        str = <<-JSON
    {"id":#{estimate.id},"point":1,"user":{"name":"iaia"}}
        JSON
        str.gsub(/\s/, '')
      end

      it '' do
        serializer = EstimateSerializer.new(estimate)
        expect(serializer.to_json).to eq json
      end
    end
  end
end
