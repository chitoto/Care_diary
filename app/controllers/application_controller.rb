class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :init_group, if: :user_signed_in?
  before_action :set_working_group, if: :user_signed_in?

  def change_keep_group(user, current_group)
    user.keep_group_id = current_group.id
    user.save!
  end


  private

  def set_working_group
    @working_group = current_user.keep_group_id ? Group.find(current_user.keep_group_id) : Group.first
  end

  def init_group
    if current_user.groups.blank?
      current_user.groups.create!(name: "グループ１", owner_id: current_user.id)
      current_user.assigns.create!(group_id: Group.first.id)
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :icon, :icon_cache, :admin, :keep_group_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :icon, :icon_cache, :admin, :keep_group_id])
  end
end
