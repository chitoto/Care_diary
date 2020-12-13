# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected
  private

  def after_sign_in_path_for(user)
    keep_group = user.keep_group_id
    if keep_group.nil?
      if user.groups.count == 1
        group_url(user.groups.first)
      else
        user_url(current_user.id)
      end
    else
      group_url(keep_group)
    end
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
