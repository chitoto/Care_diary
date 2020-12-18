class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 255 }

  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_many :assigns, dependent: :destroy
  has_many :members, through: :assigns, source: :user
  has_many :pets, dependent: :destroy
  mount_uploader :icon, ImageUploader

  def assigns_create(user, group)
    @user = User.find(user.id)
    @group = Group.find(group.id)
    @group.members << @user
  end

end
