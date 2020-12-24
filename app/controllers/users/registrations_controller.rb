# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: [:update, :destroy]

  def check_guest
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの変更・削除はできません。'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path, notice: I18n.t('views.messages.update_profile')
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(current_user.id)
    group = @user.groups
    group = group.pluck(:owner_id)
    if group.include?(@user.id)
      redirect_to root_path, notice:"グループの管理者のため削除できません！グループを削除するか管理権限を譲渡してください！"
    else
      @user.destroy
      redirect_to root_path, notice:"アカウント削除しました！"
    end
  end

  def sns_present?(session)
    password = Devise.friendly_token.first(7)
      if session[:provider].present? && session[:uid].present?
        @user = User.create(
          name: session[:name],
          email: session[:email],
          provider: [:provider],
          uid: [:uid],
          email: session[:email],
          password: "password",
          password_confirmation: "password"
        )

      else
        @user = User.create(
          name:session[:name],
          email: session[:email],
          provider: [:provider],
          uid: [:uid],
          password: session[:password],
          password_confirmation: session[:password_confirmation]
        )
      end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :icon, :uid, :provider, :icon_cache, :admin)
  end
end
