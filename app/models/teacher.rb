class Teacher < ApplicationRecord
  has_one :subject

  def self.check(teacher_name)
    teacher = Teacher.where("name LIKE ?", "%#{teacher_name}")
    binding.pry
    return true if teacher.blank?
  end

end
