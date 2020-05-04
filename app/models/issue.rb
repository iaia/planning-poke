# == Schema Information
#
# Table name: issues
#
#  id           :bigint           not null, primary key
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
end
