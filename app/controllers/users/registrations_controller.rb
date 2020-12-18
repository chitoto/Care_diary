# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  def sns_present?(session)
    password = Devise.friendly_token.first(7)
      if session[:provider].present? && session[:uid].present?
        @user = User.create(
          name: session[:name],
          email: session[:email],
          password: "password",
          password_confirmation: "password"
        )
        sns = SnsCredential.create(user_id: @user.id,uid: session[:uid], provider: session[:provider])

      else
        @user = User.create(
          name:session[:name],
          email: session[:email],
          password: session[:password],
          password_confirmation: session[:password_confirmation]
        )
      end
  end
end
