# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  # password = Devise.friendly_token.first(7)
  #
  #   if session[:provider].present? && session[:uid].present?
  #     @user = User.create(name:session[:name], email: session[:email], password: "password", password_confirmation: "password", f_name_kana: session[:f_name_kana],l_name_kana: session[:l_name_kana], f_name_kanji: session[:f_name_kanji], l_name_kanji: session[:l_name_kanji], birthday: session[:birthday], tel: params[:user][:tel])
  #     sns = SnsCredential.create(user_id: @user.id,uid: session[:uid], provider: session[:provider])
  #   else
  #     @user = User.create(name:session[:name], email: session[:email], password: session[:password], password_confirmation: session[:password_confirmation], f_name_kana: session[:f_name_kana],l_name_kana: session[:l_name_kana], f_name_kanji: session[:f_name_kanji], l_name_kanji: session[:l_name_kanji], birthday: session[:birthday], tel: params[:user][:tel])
  #   end

end
