# == Schema Information
#
# Table name: rooms
#
#  id              :bigint           not null, primary key
#  closed_at       :datetime         not null
#  name            :string           not null
#  password_digest :string           not null
#  user_count      :integer          default(0), not null
#  uuid            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'securerandom'

class Room < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :password, presence: true

  has_many :messages
  has_many :users
  has_many :issues

  before_create :set_uuid, :set_closed_at

  scope :opening, -> { where('closed_at >= ?', Time.current) }

  def set_uuid
    self.uuid = SecureRandom.uuid
  end

  def set_closed_at
    self.closed_at = if Rails.env.development?
                       Time.current + 1.day
                     else
                       Time.current + 30.minutes
                     end
  end

  def closed?
    closed_at < Time.current
  end

  def prolong
    return if closed?
    return if closed_at > Time.current + 5.minutes

    self.closed_at = Time.current + 30.minutes
    save(validate: false)
  end
end
