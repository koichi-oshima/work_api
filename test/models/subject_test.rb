# == Schema Information
#
# Table name: subjects
#
#  id         :bigint           not null, primary key
#  period     :integer
#  title      :string(255)
#  weekday    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  teacher_id :bigint
#
# Indexes
#
#  index_subjects_on_teacher_id  (teacher_id)
#
# Foreign Keys
#
#  fk_rails_...  (teacher_id => teachers.id)
#
require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
