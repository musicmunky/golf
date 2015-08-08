class CreateCourseHoles < ActiveRecord::Migration
  def change
    create_table :course_holes do |t|
      t.integer :hole_number
      t.integer :black_length
      t.integer :blue_length
      t.integer :white_length
      t.integer :red_length
      t.integer :green_length
      t.integer :senior_length
      t.integer :par
      t.integer :course_id

      t.timestamps null: false
    end
  end
end
