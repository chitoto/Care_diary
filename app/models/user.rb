class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
          # :confirmable, :omniauthable,

  validates :name, presence: true

  mount_uploader :icon, ImageUploader

  has_many :groups, foreign_key: :owner_id
  has_many :assigns, dependent: :destroy
  has_many :groups, through: :assigns
  has_many :pets, dependent: :destroy

end
