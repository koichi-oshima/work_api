FactoryBot.define do
  factory :subject do
    title { '野球基礎' }
    weekday { 'Tuesday' }
    period { 1 }
    teacher_id { 3 }
    created_at { Time.now }
    updated_at { Time.now }
  end
end