require 'rails_helper'

RSpec.describe "Wraps", type: :system do
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
      click_on '新しく登録する'
      fill_in '名前', with: 'test_pet_name'
      fill_in '誕生日', with: '002020-03-01'
      fill_in 'メモ', with: 'test_memo'
      select "#{@group_name}"
      click_on 'commit'
    end
    context '記録を新規作成した場合' do
      it '作成した記録が表示される' do
        click_on '介護記録する'
        click_on '新規登録する'
        fill_in '記録日', with: '002020-03-01'
        fill_in '項目', with: 'test_title'
        fill_in '内容', with: 'test_content'
        click_on 'commit'
        expect(page).to have_content '介護記録を登録しました'
      end
    end
    context '記録日を空にした場合' do
      it '作成済みのペット一覧が表示される' do
        click_on '介護記録する'
        click_on '新規登録する'
        fill_in '記録日', with: nil
        fill_in '項目', with: 'test_title'
        fill_in '内容', with: 'test_content'
        click_on 'commit'
        expect(page).to have_content '介護記録の登録に失敗しました'
      end
    end
    context 'condition入力する場合' do
      it 'conditionカウントが増える' do
        click_on '介護記録する'
        click_on '新規登録する'
        click_link '身体'
        fill_in '記録日', with: '002020-03-01'
        fill_in '時間', with: '1212'
        fill_in '体重', with: '10.5'
        fill_in '体温', with: '38.5'
        fill_in 'メモ', with: 'test_memo'
        click_on 'commit'
        expect(page).to have_content '1'
      end
    end
    context 'meal入力する場合' do
      it 'mealカウントが増える' do
        click_on '介護記録する'
        click_on '新規登録する'
        click_link 'ごはん'
        fill_in '記録日', with: '002020-03-01'
        fill_in '時間', with: '1212'
        fill_in '種類', with: 'ドライフード'
        fill_in '量', with: '少し残した'
        fill_in 'メモ', with: 'test_memo'
        click_on 'commit'
        expect(page).to have_content '1'
      end
    end
    context 'excretion入力する場合' do
      it 'excretionカウントが増える' do
        click_on '介護記録する'
        click_on '新規登録する'
        click_link '排泄'
        fill_in '記録日', with: '002020-03-01'
        fill_in '時間', with: '1212'
        fill_in '種類', with: '大'
        fill_in '量', with: 'たくさん'
        fill_in 'におい', with: '健康的！'
        fill_in 'メモ', with: 'test_memo'
        click_on 'commit'
        expect(page).to have_content '1'
      end
    end
    context 'medicine入力する場合' do
      it 'medicineカウントが増える' do
        click_on '介護記録する'
        click_on '新規登録する'
        click_link 'お薬'
        fill_in '記録日', with: '002020-03-01'
        fill_in '時間', with: '1212'
        fill_in '種類', with: '4日に一回のやつ'
        fill_in 'メモ', with: 'test_memo'
        click_on 'commit'
        expect(page).to have_content '1'
      end
    end
    context 'medicine入力する場合' do
      it 'medicineカウントが増える' do
        click_on '介護記録する'
        click_on '新規登録する'
        click_link 'さんぽ'
        fill_in '記録日', with: '002020-03-01'
        fill_in '時間', with: '1212'
        fill_in '実行時間', with: '１時間'
        fill_in 'メモ', with: 'test_memo'
        click_on 'commit'
        expect(page).to have_content '1'
      end
    end

  end
end
