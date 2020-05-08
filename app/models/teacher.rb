# == Schema Information
#
# Table name: teachers
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Teacher < ApplicationRecord
  has_one :subject

  def self.check(teacher_name)
    teacher = Teacher.where("name LIKE ?", "%#{teacher_name}")
    #binding.pry
    return true if teacher.blank?
  end

end
