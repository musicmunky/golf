class User < ActiveRecord::Base
	rolify :before_add => :before_add_method
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
			:recoverable, :rememberable, :trackable, :validatable
	has_many :rounds

	def before_add_method(role)
		# do something before it gets added
	end

	def self.full_name(u)
		return "#{u.first_name} #{u.last_name}"
	end

end
