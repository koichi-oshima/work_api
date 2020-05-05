class Subject < ApplicationRecord
  belongs_to :teacher
  has_many :lectures

  def self.search(keyword, teacher_name)

    # データ検索
    #Subject.joins(:teacher, :lectures)
    data = Subject.joins(:teacher, :lectures)
      .group(:teacher_id)
      .where("subjects.title LIKE ? AND teachers.name LIKE ? ", "%#{keyword}%", "%#{teacher_name}%")
      .order("lectures.date")

   #binding.pry

    # jsonフォーマット
    #Subject.preload(:teacher, :lectures).as_json(include: [:teacher, :lectures])

    # このクエリにwhere句を追加したい。
     #Subject.preload(:teacher, :lectures).as_json(

     # エラーになる。
     #Subject.preload(:teacher, :lectures).where(teacher: { name: "山田太郎" }).as_json(

     #dataに検索結果を格納
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
