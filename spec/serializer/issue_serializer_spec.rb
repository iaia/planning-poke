require 'rails_helper'

RSpec.describe IssueSerializer, type: :serializer do
  describe 'render' do
    context 'valid params' do
      let(:user) do
        create(:user)
      end
      let(:issue) do
        create(:issue)
      end
      let!(:estimate) do
        Estimate.create!(
          {
            point: 1,
            user_id: user.id,
            issue_id: issue.id
          }
        )
      end

      context 'issueがdone' do
        let(:json) do
          str = <<-JSON
  {"id":#{issue.id},"issue_number":"#123","estimates":[{"id":#{estimate.id},"point":1,"user":{"name":"iaia"}}]}
          JSON
          str.gsub(/\s/, '')
        end

        before do
          issue.done!
        end

        it 'jsonが正しい' do
          current_room = Room.find(issue.room_id)
          issues = current_room
            .issues
            .done
            .left_joins(estimates: :user)
            .order(id: :desc).first
          serializer = IssueSerializer.new(issues)
          expect(serializer.to_json(include: { estimates: :user })).to eq json
        end
      end

      context 'issueが未done' do
        let(:json) do
          str = <<-JSON
  {"id":#{issue.id},"issue_number":"#123","estimates":[{"id":#{estimate.id},"point":"?","user":{"name":"iaia"}}]}
          JSON
          str.gsub(/\s/, '')
        end

        it 'jsonが正しい' do
          current_room = Room.find(issue.room_id)
          issues = current_room
            .issues
            .doing
            .left_joins(estimates: :user)
            .order(id: :desc).first
          serializer = IssueSerializer.new(issues)
          expect(serializer.to_json(include: { estimates: :user })).to eq json
        end
      end
    end
  end
end
