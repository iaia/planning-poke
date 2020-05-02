# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :bigint
#
class User < ApplicationRecord
  belongs_to :room, counter_cache: :user_count, optional: true

  has_many :messages
  has_many :estimates
end
