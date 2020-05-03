class CreateLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures do |t|
      t.string :title
      t.date :date
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
