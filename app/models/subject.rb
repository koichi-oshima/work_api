class Subject < ApplicationRecord
  belongs_to :teacher
  has_many :lectures

  def self.search(keyword, teacher_name)

    #@temp = Subject.joins(:teacher, :lectures)
    #.select("
    #  subjects.id,
    #  subjects.title,
    #  subjects.weekday,
    #  subjects.period,
    #  teachers.id as teacher_id,
    #  teachers.name as teacher_name,
    #  lectures.id as lecture_id,
    #  lectures.title as lecture_title,
    #  lectures.date as lecture_date
    #")
    #.where("subjects.title LIKE ? AND teachers.name LIKE ? ", "%#{keyword}%", "%#{teacher_name}%")
    #.order("subjects.id")


    Subject.preload(:teacher, :lectures)
      .as_json(
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
