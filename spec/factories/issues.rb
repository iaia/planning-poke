FactoryBot.define do
  factory :issue do
    issue_number { '#123' }
    association :room
  end
end
