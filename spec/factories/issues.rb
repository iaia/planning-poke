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
FactoryBot.define do
  factory :issue do
    issue_number { '#123' }
    association :room
  end
end
