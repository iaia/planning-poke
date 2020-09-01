# == Schema Information
#
# Table name: issues
#
#  id           :bigint           not null, primary key
#  done         :boolean          default(FALSE), not null
#  issue_number :string           not null
#  state        :string
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

      it 'issueが作れる' do
        issue = Issue.new(params)
        expect(issue).to be_valid
        issue.save!
        expect(issue.issue_number).to eq '#123'
        expect(issue.room).to eq room
      end
    end

    context 'state' do
      let(:room) do
        create(:room)
      end
      let(:issue) do
        create(:issue)
      end

      context 'init' do
        it 'createdになっている' do
          expect(issue).to be_created
        end
      end

      context '#estimating' do
        context 'createdのとき' do
          it 'doingになる' do
            issue.estimating
            expect(issue).to be_doing
          end
        end

        context 'すでにestimatingしているとき' do
          before do
            issue.estimating!
          end

          it 'doingのまま' do
            issue.estimating
            expect(issue).to be_doing
          end
        end

        context 'すでにpublishしているとき' do
          before do
            issue.estimating!
            issue.publish!
          end

          it 'publishedのまま' do
            issue.estimating
            expect(issue).to be_published
          end
        end
      end

      context '#publish' do
        before do
          issue.estimating!
          expect(issue).to be_doing
        end

        it 'doingのまま' do
          issue.publish
          expect(issue).to be_published
        end
      end

      context '#done' do
        before do
          issue.estimating!
        end

        it 'doneになる' do
          issue.done
          expect(issue).to be_done
        end
      end
    end
  end
end
