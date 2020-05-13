# == Schema Information
#
# Table name: issues
#
#  id           :bigint           not null, primary key
#  done         :boolean          default(FALSE), not null
#  issue_number :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  room_id      :bigint
#
# Indexes
#
#  index_issues_on_room_id  (room_id)
#
require 'rails_helper'

RSpec.describe Issue, type: :model do
  describe '.create' do
    context 'valid params' do
      let(:room) do
        create(:room)
      end
      let(:params) do
        {
          issue_number: '#123',
          room_id: room.id
        }
      end

      it '' do
        issue = Issue.new(params)
        expect(issue).to be_valid
        issue.save!
        expect(issue.issue_number).to eq '#123'
        expect(issue.room).to eq room
      end
    end
  end
end
