class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  mount_uploader :icon, ImageUploader

  has_many :assigns
  has_many :users, through: :assigns
  has_many :pets
  accepts_nested_attributes_for :assigns
end
