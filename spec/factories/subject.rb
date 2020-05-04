FactoryBot.define do
  factory :subject do
    sequence(:title) { |n| "TEST_TITLE#{n}"}
  end
end