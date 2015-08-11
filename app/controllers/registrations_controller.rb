class RegistrationsController < Devise::RegistrationsController # < ApplicationController

	after_filter :add_role

	protected

		def add_role
			if resource.persisted?
				resource.add_role :user
			end
		end


	private

		def sign_up_params
			params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
		end

		def account_update_params
			params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
		end

end
