# == Schema Information
#
# Table name: rooms
#
#  id              :bigint           not null, primary key
#  closed_at       :datetime         default(Tue, 09 Jun 2020 13:46:50 UTC +00:00), not null
#  name            :string           not null
#  password_digest :string           not null
#  user_count      :integer          default(0), not null
#  uuid            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :room do
    name { 'test-room' }
    password { 'password' }
  end
end
