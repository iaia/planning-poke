require 'rails_helper'

RSpec.describe 'Rooms', type: :request do
  describe 'create' do
    context '' do
      let(:params) do
        {
          name: 'test-room',
          password: 'test-password'
        }
      end
      it '' do
        expect do
          post rooms_path, params: { room: params }
        end.to change(Room, :count).by(1)
      end
    end
  end

  describe 'show' do
    context '' do
      let!(:room) do
        Room.create!(
          name: 'test-room',
          password: 'test-password'
        )
      end

      it '' do
        get rooms_path(room.id)
        expect(response).to have_http_status(200)
      end
    end
  end
end
