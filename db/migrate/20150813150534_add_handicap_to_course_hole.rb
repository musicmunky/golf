class AddHandicapToCourseHole < ActiveRecord::Migration
  def change
	  add_column :course_holes, :handicap, :integer
  end
end
