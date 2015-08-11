class AddCourseTypeName < ActiveRecord::Migration
  def change
	  add_column :course_types, :name, :string
  end
end
