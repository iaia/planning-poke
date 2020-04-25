# == Schema Information
#
# Table name: rooms
#
#  id              :bigint           not null, primary key
#  name            :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Room < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :password, presence: true

  has_many :messages
end
