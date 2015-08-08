class CreateRoundHoles < ActiveRecord::Migration
  def change
    create_table :round_holes do |t|
      t.integer :round_id
      t.integer :course_hole_id
      t.integer :score
      t.integer :putts

      t.timestamps null: false
    end
  end
end
