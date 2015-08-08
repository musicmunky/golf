class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :course_id
      t.integer :user_id
      t.datetime :round_date

      t.timestamps null: false
    end
  end
end
