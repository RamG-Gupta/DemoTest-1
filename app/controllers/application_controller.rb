class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
 #protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


	private

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user
	protected

	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	  devise_parameter_sanitizer.permit(:account_update , keys: [:name])
	end
end
