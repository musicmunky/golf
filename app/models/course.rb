class Course < ActiveRecord::Base
	belongs_to :course_type
	has_many :course_holes
	validates_presence_of :name, :address1, :city, :state, :course_type_id
end
