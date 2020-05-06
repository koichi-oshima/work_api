FactoryBot.define do
  factory :lecture_1 do
    title { 'ガイダンス' }
    date { 2020-04-23 }
    subject_id { 3 }
    created_at { Time.now }
    updated_at { Time.now }
  end

  factory :lecture_2 do
    title { '野球の歴史' }
    date { 2020-04-30 }
    subject_id { 3 }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
