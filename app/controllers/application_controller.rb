class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :icon, :icon_cache, :admin, :keep_group_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :icon, :icon_cache, :admin, :keep_group_id])
  end
end
