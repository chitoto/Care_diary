require 'rails_helper'
RSpec.describe 'ペット管理機能', type: :system do
  before do
    FactoryBot.create(:pet)
  end
  describe '新規登録機能' do
    context 'ペットを新規登録した場合' do
      it '登録したペットが表示される' do
       pet = FactoryBot.create(:pet, name: 'test')
       visit pets_path
       expect(page).to have_content 'test'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのペット一覧が表示される' do
        pet = FactoryBot.create(:pet, name: 'index_test')
        visit pets_path
        expect(page).to have_content 'index_test'
      end
    end
  end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当ペットの内容が表示される' do
         visit new_pet_path
         fill_in '名前', with: '詳細test_name'
         fill_in '誕生日', with: '002020-03-01'
         fill_in 'メモ', with: '詳細test_memo'
         click_on '登録する'
         expect(page).to have_content '詳細test_name'
         expect(page).to have_content '詳細test_memo'
       end
     end
  end
end
