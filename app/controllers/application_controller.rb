class ApplicationController < ActionController::Base
	before_action :authenticate_user!, except: "users/omniauth_callbacks#facebook"
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

  	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:account_update, keys: [:role])
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:password_confirmation])
    	#devise_parameter_sanitizer.permit(:sign_in, keys: [:password_confirmation])
  	end
end
