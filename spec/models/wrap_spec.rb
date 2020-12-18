require 'rails_helper'

RSpec.describe Wrap, type: :model do
  describe 'pet登録機能' do
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
          date_record: '2020/01/01',
          pet_id: @pet.id
        )
          expect(wrap).to be_valid
      end
    end
    context '入力に空がある場合' do
      it "is invalid without a date_record" do
        wrap = Wrap.new(
          precaution_title: 'rspec',
          precaution_content: 'rspec',
          date_record: nil,
          pet_id: @pet.id
        )
        wrap.valid?
        expect(wrap.errors[:date_record]).to include("を入力してください")
      end
    end
    context '文字数が制限を超えている場合' do
      it "is invalid with precaution_title is 255 or more characters" do
        wrap = Wrap.new(precaution_title: 'a' * 256)
        wrap.valid?
        expect(wrap.errors[:precaution_title]).to include("は255文字以内で入力してください")
      end
      it "is invalid with precaution_content is 255 or more characters" do
        wrap = Wrap.new(precaution_content: 'a' * 256)
        wrap.valid?
        expect(wrap.errors[:precaution_content]).to include("は255文字以内で入力してください")
      end
    end

  end
end
