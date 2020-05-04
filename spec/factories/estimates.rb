FactoryBot.define do
  factory :estimate do
    point { 0 }
    association :issue
    association :user
  end
end
