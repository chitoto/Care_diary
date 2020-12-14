class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_many :assigns, dependent: :destroy
  has_many :members, through: :assigns, source: :user
  has_many :pets, dependent: :destroy
  mount_uploader :icon, ImageUploader

  def add_group_member(user, group)
    assigns.create(user_id: user.id, group_id: group.id)
  end
end
