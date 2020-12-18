require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe 'pet登録機能' do
    before do
      user = FactoryBot.create(:user)
      @group = FactoryBot.create(:group, owner_id: user.id)
    end
    context '入力機能' do
      it "is valid with a name, icon, rating" do
        pet = Pet.new(
          name: 'rspec',
          birthday: '2020/01/01',
          gender: 1,
          species: 'rspec',
          memo: 'rspec',
          icon: File.open("./app/assets/images/icon.png"),
          group_id: @group.id
        )
          expect(pet).to be_valid
      end
    end
    context '入力に空がある場合' do
      it "is invalid without a name" do
        pet = Pet.new(
          name: nil,
          birthday: '2020/01/01',
          gender: 1,
          species: 'rspec',
          memo: 'rspec',
          icon: File.open("./app/assets/images/icon.png"),
          group_id: @group.id
        )
        pet.valid?
        expect(pet.errors[:name]).to include("を入力してください")
      end
    end
    context '文字数が制限を超えている場合' do
      it "is invalid with name is 255 or more characters" do
        pet = Pet.new(name: 'a' * 256)
        pet.valid?
        expect(pet.errors[:name]).to include("は255文字以内で入力してください")
      end
    end

  end
end
