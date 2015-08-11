class AddCourseTypeDescription < ActiveRecord::Migration
  def change
	  add_column :course_types, :description, :text
  end
end
