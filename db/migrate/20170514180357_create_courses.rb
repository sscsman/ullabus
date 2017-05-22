class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :coursename
      t.string :teacher
      t.integer :credits
      t.string :duration
      t.string :weekday
      t.string :code
      t.string :univ
      t.string :dept
      t.integer :creator

      t.timestamps null: false
    end
  end
end
