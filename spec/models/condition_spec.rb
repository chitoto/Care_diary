require 'rails_helper'

RSpec.describe Condition, type: :model do
  describe 'condition登録機能' do
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
        Condition.new(
          start_time: '0200',
          weight: '10.5',
          temperature: '38.5',
          memo: 'test_memo',
          wrap_id: wrap.id
        )
          expect(wrap).to be_valid
      end
    end
    context 'バリデーションにかかる場合' do
      it "is invalid with weight >0" do
        wrap = Wrap.new(
          precaution_title: 'rspec',
          precaution_content: 'rspec',
          start_time: '2020/01/01',
          pet_id: @pet.id
        )
        condition = Condition.new(
          start_time: '0200',
          weight: '-10.5',
          temperature: '38.5',
          memo: 'test_memo',
          wrap_id: wrap.id
        )
        condition.valid?
        expect(condition.errors[:weight]).to include("は'0'以上でご入力ください")
      end
    end
    context 'バリデーションにかかる場合' do
      it "is invalid with temperature >0" do
        wrap = Wrap.new(
          precaution_title: 'rspec',
          precaution_content: 'rspec',
          start_time: '2020/01/01',
          pet_id: @pet.id
        )
        condition = Condition.new(
          start_time: '0200',
          weight: '10.5',
          temperature: '-38.5',
          memo: 'test_memo',
          wrap_id: wrap.id
        )
        condition.valid?
        expect(condition.errors[:temperature]).to include("は'0'以上でご入力ください")
      end
    end

  end
end
