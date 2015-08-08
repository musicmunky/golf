class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :course_type_id

      t.timestamps null: false
    end
  end
end
