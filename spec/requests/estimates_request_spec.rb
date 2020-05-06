require 'rails_helper'

RSpec.describe 'Estimates', type: :request do
  let(:action_cable_mock) do
    double
  end

  before do
    post users_path, user: { name: 'tester' }
    post rooms_path, room: { name: 'testroom', password: 'pass' }
    post issues_path, issue: { issue_number: '#123' }, format: :json, xhr: true
    @issue_id = Issue.find_by(issue_number: '#123').id

    allow(ActionCable).to receive(:server).and_return action_cable_mock
    allow(action_cable_mock).to receive(:broadcast)
  end

  describe 'POST #create' do
    context '1人いるroom' do
      let(:params) do
        {
          point: 1,
          issue_id: @issue_id
        }
      end

      it 'estimateが作成される' do
        expect do
          post estimates_path(issue_id: @issue_id), estimate: params, format: :json
        end.to change(Estimate, :count).by(1)
      end

      it '1人がestimatesを設定すると通知される' do
        post estimates_path(issue_id: @issue_id), estimate: params, format: :json
        expect(action_cable_mock).to have_received(:broadcast)
      end
    end

    context '2人いるroom' do
      let(:params) do
        {
          point: 1,
          issue_id: @issue_id
        }
      end

      it '1人がestimatesを設定しても通知されない' do
        post estimates_path(issue_id: @issue_id), estimate: params, format: :json
        expect(action_cable_mock).not_to receive(:broadcast)
      end

      it '2人がestimatesを設定すると通知される' do
        post estimates_path(issue_id: @issue_id), estimate: params, format: :json
        expect(action_cable_mock).to have_received(:broadcast)
      end
    end

    context 'すでにcreate済みで変更した場合' do
      let(:params) do
        {
          point: 1,
          issue_id: @issue_id
        }
      end

      before do
        post estimates_path(issue_id: @issue_id), estimate: {
          point: 0,
          issue_id: @issue_id
        }
      end

      it '新たに作成されず更新される' do
        expect do
          post estimates_path(issue_id: @issue_id), estimate: params, format: :json
        end.not_to change(Estimate, :count)
      end
    end
  end
end
