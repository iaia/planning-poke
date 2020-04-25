# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_messages_on_room_id  (room_id)
#  index_messages_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '.create' do
    let(:user) do
      User.create(name: 'iaia')
    end
    let(:room) do
      Room.create(name: 'test-room', password: 'password')
    end

    context '' do
      let(:message_params) do
        {
          body: 'hello'
        }
      end

      it '' do
        expect do
          message = user.messages.create(
            body: message_params[:body],
            room: room
          )
        end.to change(Message, :count).by(1)
      end
    end
  end
end
