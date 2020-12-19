require 'rails_helper'

RSpec.describe "Pets", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  describe '新規登録機能' do
    before do
      @group_name = 'test_group'
      visit  new_user_session_path
      fill_in 'メール', with: "#{@user.email}"
      fill_in 'パスワード', with: "#{@user.password}"
      click_on 'commit'
      visit  new_group_path
      fill_in 'グループ名', with: "#{@group_name}"
      click_on '登録する'
    end
    context 'ペットを新規登録した場合' do
      it '登録したペットが表示される' do
      click_on '新しく登録する'
       fill_in '名前', with: 'test_pet_name'
       fill_in '誕生日', with: '002020-03-01'
       fill_in 'メモ', with: 'test_memo'
       select "#{@group_name}"
       click_on 'commit'
       expect(page).to have_content 'test_pet_name'
      end
    end
    context '一覧画面(group#show)に遷移した場合' do
      before do
        click_on '新しく登録する'
         fill_in '名前', with: 'test_pet_name'
         fill_in '誕生日', with: '002020-03-01'
         fill_in 'メモ', with: 'test_memo'
         select "#{@group_name}"
         click_on 'commit'
      end
      it '作成済みのペット一覧が表示される' do
        click_on 'グループ詳細へ戻る'
        expect(page).to have_content 'test_pet_name'
      end
    end
  end
end
