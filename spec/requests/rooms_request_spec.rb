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
    let!(:room) do
      Room.create!(
        name: 'test-room',
        password: 'test-password'
      )
    end

    context '' do
      it '' do
        get rooms_path, params: { id: room.id, password: 'test-password' }
        expect(response).to have_http_status(200)
      end
    end

    context '' do
      it '' do
        get rooms_path, params: { id: room.id, password: 'different' }
        expect(response).to redirect_to(action: :new)
      end
    end
  end
end
