class AdminController < ApplicationController
	def pages
	end

	def index
		if current_user.nil? or !current_user.has_role? :admin
			respond_to do |format|
				format.html { redirect_to root_url, notice: 'You are not authorized to view that page' }
				#		format.json { head :no_content }
			end
		end
	end
end
