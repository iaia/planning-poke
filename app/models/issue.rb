# == Schema Information
#
# Table name: issues
#
#  id           :bigint           not null, primary key
#  done         :boolean          default(FALSE), not null
#  issue_number :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  room_id      :bigint
#
# Indexes
#
#  index_issues_on_room_id  (room_id)
#
class Issue < ApplicationRecord
  belongs_to :room
  has_many :estimates

  after_create :prolong_room

  scope :done, -> { where('done = true') }
  scope :doing, -> { where('done = false') }

  def done!
    update!(done: true)
  end

  def prolong_room
    room.prolong
  end
end
