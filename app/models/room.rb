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

require 'securerandom'

class Room < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :password, presence: true

  has_many :messages
  has_many :users
  has_many :issues

  before_create :set_uuid

  def set_uuid
    self.uuid = SecureRandom.uuid
  end

  # TODO: 閉じる機能が欲しい 例えば30分使われていなければ「閉じて」、アクセス出来ないようにする
end
