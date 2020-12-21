require 'rails_helper'

RSpec.describe Meal, type: :model do
  describe 'meal登録機能' do
    before do
      user = FactoryBot.create(:user)
      group = FactoryBot.create(:group, owner_id: user.id)
      @pet = FactoryBot.create(:pet, group_id: group.id)
    end
    context '入力機能' do
      it "is valid with a name, icon, rating" do
        wrap = Wrap.new(
          precaution_title: 'rspec',
          precaution_content: 'rspec',
          start_time: '2020/01/01',
          pet_id: @pet.id
        )
        Meal.new(
          start_time: '0200',
          shape: 'ドライフード',
          amount: '少し残した',
          memo: 'test_memo',
          wrap_id: wrap.id
        )
          expect(wrap).to be_valid
      end
    end

  end
end
