class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name age avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name age avatar])
  end
end
