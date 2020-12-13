class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_many :assigns, dependent: :destroy
  has_many :members, through: :assigns, source: :user
  has_many :users, foreign_key: :keep_group_id
  has_many :pets, dependent: :destroy
  mount_uploader :icon, ImageUploader

  def invite_member(user)
    assigns.create(user: user)
  end
end
