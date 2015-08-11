class Course < ActiveRecord::Base
	belongs_to :course_type
	#attr_accessor :name, :address1, :address2, :address3, :city, :state, :zip, :course_type_id
	validates_presence_of :name, :address1, :city, :state, :course_type_id
end
