require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe '新規登録機能' do
    context 'ユーザーを新規登録した場合' do
      it '登録したnoticeが表示される' do
        visit  new_user_registration_path
        fill_in '名前', with: '詳細test_name'
        fill_in 'メール', with: 'test_name@exam.com'
        fill_in 'パスワード', with: 'test_password'
        fill_in '確認用パスワード', with: 'test_password'
        click_on 'アカウント登録'
        expect(page).to have_content 'アカウント登録が完了しました'
      end
    end
    context '名前がからの場合' do
      it '登録したnoticeが表示される' do
        visit  new_user_registration_path
        fill_in '名前', with: nil
        fill_in 'メール', with: 'test_name@exam.com'
        fill_in 'パスワード', with: 'test_password'
        fill_in '確認用パスワード', with: 'test_password'
        click_on 'アカウント登録'
        expect(page).to have_content '名前を入力してください'
      end
    end
    context 'メールアドレスが重複した場合' do
      before do
        @user = FactoryBot.create(:user)
      end
      it '登録したnoticeが表示される' do
        visit  new_user_registration_path
        fill_in '名前', with: '詳細test_name'
        fill_in 'メール', with: "#{@user.email}"
        fill_in 'パスワード', with: 'test_password'
        fill_in '確認用パスワード', with: 'test_password'
        click_on 'アカウント登録'
        expect(page).to have_content 'メールはすでに存在します'
      end
    end
  end
  describe 'ログイン機能' do
    context 'ユーザー登録をしていない場合' do
      it '登録したnoticeが表示される' do
        visit  new_user_session_path
        fill_in 'メール', with: 'test_name@exam.com'
        fill_in 'パスワード', with: 'test_password'
        click_on 'commit'
        expect(page).to have_content 'メールまたはパスワードが違います'
      end
    end
    context 'ユーザーログインした場合' do
      before do
        @user = FactoryBot.create(:user)
      end
      it '登録したnoticeが表示される' do
        visit  new_user_session_path
        fill_in 'メール', with: "#{@user.email}"
        fill_in 'パスワード', with: "#{@user.password}"
        click_on 'commit'
        expect(page).to have_content 'ログインしました'
      end
    end
  end


end
