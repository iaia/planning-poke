require 'rails_helper'

RSpec.describe 'Rooms', type: :request do
  before do
    post users_path, user: { name: 'tester' }
  end
  describe 'POST #create' do
    context 'valid parameter' do
      let(:params) do
        {
          name: 'test-room',
          password: 'test-password'
        }
      end
      it '' do
        expect do
          post rooms_path, { room: params }
        end.to change(Room, :count).by(1)
      end
    end
  end

  describe 'GET #index' do
    before do
      post rooms_path, { room: { name: 'tester', password: 'test-password' } }
      @room = Room.find_by(name: 'tester')
    end

    context 'valid password' do
      it '' do
        get rooms_path, room: { id: @room.id, password: 'test-password' }
        expect(response).to have_http_status(200)
      end
    end

    context 'invalid password' do
      it '' do
        get rooms_path, room: { id: @room.id, password: 'different' }
        expect(response).to redirect_to(action: :new)
      end
    end
  end
end
