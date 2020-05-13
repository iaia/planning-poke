# == Schema Information
#
# Table name: rooms
#
#  id              :bigint           not null, primary key
#  name            :string           not null
#  password_digest :string           not null
#  user_count      :integer          default(0), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :room do
    name { 'test-room' }
    password { 'password' }
  end
end
