require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST #create' do
    context 'valid parameter' do
      let(:params) do
        {
          name: 'tester'
        }
      end

      it '' do
        expect do
          post users_path, { user: params }
        end.to change(User, :count).by(1)
      end
    end
  end
end
