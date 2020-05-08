# == Schema Information
#
# Table name: teachers
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :teacher do
    name { '鈴木一郎' }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
