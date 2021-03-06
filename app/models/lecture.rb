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
class Lecture < ApplicationRecord
  belongs_to :subject
end
