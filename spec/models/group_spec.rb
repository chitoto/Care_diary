require 'rails_helper'
RSpec.describe Group, type: :model do
  describe 'group登録機能' do
    before do
      @user = FactoryBot.create(:user)
    end
    it "is valid with a name, icon, rating" do
      group = Group.new(
        name: 'rspec',
        owner_id: @user.id,
        icon: File.open("./app/assets/images/icon.png")
      )
        expect(group).to be_valid
    end
    context '入力に空がある場合' do
      it "is invalid without a name" do
        group = Group.new(
          name: nil,
          owner_id: @user.id
        )
        group.valid?
        expect(group.errors[:name]).to include("を入力してください")
      end
      it "is valid without a icon" do
        group = Group.new(
          name: 'rspec',
          owner_id: @user.id,
          icon: nil
        )
        expect(group).to be_valid
      end
    end
    it "is invalid with a duplicate name" do
      Group.create(
        name: 'rspec',
        owner_id: @user.id
      )
      group = Group.new(
        name: 'rspec',
        owner_id: 1
      )
      group.valid?
      expect(group.errors[:name]).to include("はすでに存在します")
    end
    it "is invalid with name is 255 or more characters" do
      group = Group.new(name: 'a' * 256)
      group.valid?
      expect(group.errors[:name]).to include("は255文字以内で入力してください")
    end
  end

end
