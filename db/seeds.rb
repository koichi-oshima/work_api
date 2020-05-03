# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Teacher.create!(
  [
    {
      name: 'テスト太郎'
    },
    {
      name: 'テスト徹子'
    }
  ]
)


Subject.create!(
  [
    {
      title: '統計基礎',
      weekday: 'Monday',
      period: 1,
      teacher_id: 1
    },
    {
      title: 'データ分析基礎',
      weekday: 'Friday',
      period: 2,
      teacher_id: 2,
    }
  ]
)


Lecture.create!(
  [
    {
      title: 'ガイダンス',
      date: '2020-04-23',
      subject_id: 1
    },
    {
      title: '確率変数と確率分布',
      date: '2020-04-30',
      subject_id: 1
    },
    {
      title: 'ガイダンス',
      date: '2020-04-23',
      subject_id: 2
    },
    {
      title: 'データ分析の歴史',
      date: '2020-04-30',
      subject_id: 2
    }
  ]
)