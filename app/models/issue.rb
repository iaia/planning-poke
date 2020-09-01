# == Schema Information
#
# Table name: issues
#
#  id           :bigint           not null, primary key
#  done         :boolean          default(FALSE), not null
#  issue_number :string           not null
#  state        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  room_id      :bigint
#
# Indexes
#
#  index_issues_on_room_id  (room_id)
#
class Issue < ApplicationRecord
  include AASM

  belongs_to :room
  has_many :estimates

  after_create :prolong_room

  scope :done, -> { where('done = true') }
  scope :doing, -> { where('done = false') }

  aasm column: 'state' do
    state :created, initial: true
    state :doing
    state :published
    state :done

    event :estimating do
      transitions from: %i[created doing], to: :doing
      transitions from: :published, to: :published
    end

    event :publish do
      transitions from: :doing, to: :published
    end

    event :done do
      transitions from: :doing, to: :done
    end
  end

  def done!
    update!(done: true)
  end

  def prolong_room
    room.prolong
  end
end
