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
class Subject < ApplicationRecord
  belongs_to :teacher
  has_many :lectures

  # データの有無を確認
  def self.check(keyword)
    subject = Subject.where("title LIKE ?", "%#{keyword}%")
    #binding.pry
    return true if subject.blank?
  end

  # データ検索
  def self.search(keyword, teacher_name)

    data = Subject.joins(:teacher, :lectures)
    .group(:teacher_id)
    .where("subjects.title LIKE ? AND teachers.name LIKE ? ", "%#{keyword}%", "%#{teacher_name}%")
    .order("lectures.date")

    # 必要なデータのみ整形
    data.as_json(
      :only => [:id, :title, :weekday, :period],
      include:
      [
        {
          teacher: {
            only: [:id, :name]
          }
        },
        {
          lectures: {
            only: [:id, :title, :date]
          }
        }
      ]
    )

  end
end
