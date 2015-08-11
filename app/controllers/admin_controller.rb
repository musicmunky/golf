class AdminController < ApplicationController
	def pages
	end

	def index
		if !current_user.has_role? :admin
			respond_to do |format|
				format.html { redirect_to root_url, notice: 'You must be an admin to view that page' }
				#		format.json { head :no_content }
			end
		end
	end
end
