require 'rails_helper'
RSpec.describe Pet, type: :model do
  # 名前と種別とメモがあれば有効な状態であること
  it "is valid with a name" do
    pet = Pet.new(
      name: 'DIC',
      species: "aaa",
      memo: 'bbb')
    expect(pet).to be_valid
  end
  # 名前がなければ無効な状態であること
  it "is invalid without a name" do
    pet = Pet.new(name: nil)
    pet.valid?
    expect(pet.errors[:name]).to include("を入力してください")
  end
end
