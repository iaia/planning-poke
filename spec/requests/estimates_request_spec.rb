require 'rails_helper'

RSpec.describe 'Estimates', type: :request do
  before do
    with_session(:issue) do
      post users_path, params: { user: { name: 'tester' } }
      post rooms_path, params: { room: { name: 'testroom', password: 'pass' } }
      post issues_path, params: { issue: { issue_number: '#123' } }, xhr: true
      json ||= JSON.parse(last_response.body)
      @issue_id = json['id']
    end
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
          post estimates_path, params: { estimate: params }
        end.to change(Estimate, :count).by(1)
      end

      it '1人がestimatesを設定すると通知される' do
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
        expect do
          post estimates_path, params: { estimate: params }
        end.to change(Estimate, :count).by(1)
      end

      it '2人がestimatesを設定すると通知される' do
        expect do
          post estimates_path, params: { estimate: params }
        end.to change(Estimate, :count).by(1)
      end
    end

    context 'すでにcreate済みで変更した場合' do
      let(:params) do
        {
          point: 1,
          issue_id: @issue_id
        }
      end

      it '新たに作成されず更新される' do
      end
    end
  end
end
