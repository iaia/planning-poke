# == Schema Information
#
# Table name: rooms
#
#  id              :bigint           not null, primary key
#  name            :string           not null
#  password_digest :string           not null
#  user_count      :integer          default(0), not null
#  uuid            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe Room, type: :model do
  describe '.create' do
    let(:params) do
      {
        name: 'test-room',
        password: 'test-password'
      }
    end

    context 'validation' do
      it 'success' do
        room = Room.new(params)
        expect(room).to be_valid
        room.save!
        expect(room.name).to eq 'test-room'
        expect(room.password).to eq 'test-password'
      end
    end
  end
end
