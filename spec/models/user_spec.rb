require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'user登録機能' do
    context '全て入力してある場合' do
      it "is valid with a name, email, password, rating" do
        user = User.new(
          name: 'rspec',
          email: "rspec@test.com",
          password:  "password" )
          expect(user).to be_valid
      end
    end
    context '入力にからがある場合' do
      it "is invalid without a name" do
        user = User.new(name: nil)
        user.valid?
        expect(user.errors[:name]).to include("を入力してください")
      end
      it "is invalid without a email" do
        user = User.new(email: nil)
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end
      it "is invalid without a password" do
        user = User.new(password: nil)
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end
    end
    context 'ユニーク設定' do
      it "is invalid with a duplicate email" do
        User.create(
          name: 'rspec',
          email: "rspec@test.com",
          password:  "password" )
        user = User.new(
          name: 'rspec',
          email: "rspec@test.com",
          password:  "password" )
        user.valid?
        expect(user.errors[:email]).to include("はすでに存在します")
      end
    end
    context '文字数制限がある場合' do
      it "is invalid with password is 6 or less characters" do
        user = User.new(password: 'a' * 5)
        user.valid?
        expect(user.errors[:password]).to include("は6文字以上で入力してください")
      end
    end

  end
end
