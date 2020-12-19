require 'rails_helper'

RSpec.describe "Groups", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  describe 'グループ機能' do
    before do
      visit  new_user_session_path
      fill_in 'メール', with: "#{@user.email}"
      fill_in 'パスワード', with: "#{@user.password}"
      click_on 'commit'
    end
    context 'グループを新規作成した場合' do
      it '登録したnoticeが表示される' do
        visit  new_group_path
        fill_in 'グループ名', with: 'group_test'
        click_on '登録する'
        expect(page).to have_content 'グループを作成しました'
        expect(page).to have_content 'group_test'
      end
    end
    context 'グループ名が空の場合' do
      it '登録したnoticeが表示される' do
        visit  new_group_path
        fill_in 'グループ名', with: nil
        click_on '登録する'
        expect(page).to have_content 'グループ名を入力してください'
      end
    end
    context 'グループ名が重複した場合' do
      before do
        @group = FactoryBot.create(:group, owner_id: "#{@user.id}")
      end
      it '登録したnoticeが表示される' do
        visit  new_group_path
        fill_in 'グループ名', with: "#{@group.name}"
        click_on '登録する'
        expect(page).to have_content 'グループ名はすでに存在します'
      end
    end
  end

end
