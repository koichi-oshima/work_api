# == Schema Information
#
# Table name: lectures
#
#  id         :bigint           not null, primary key
#  date       :date
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject_id :bigint
#
# Indexes
#
#  index_lectures_on_subject_id  (subject_id)
#
# Foreign Keys
#
#  fk_rails_...  (subject_id => subjects.id)
#
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
