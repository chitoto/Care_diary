class Pet < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validate :date_before_today
  validates :species, length: { maximum: 255 }
  validates :memo, length: { maximum: 255 }

  enum gender: { 男の子:1, 女の子:2, わからない:3 }
  mount_uploader :icon, ImageUploader

  belongs_to :group
  has_many :wraps, dependent: :destroy
  has_many :comments, dependent: :destroy

  private

  def date_before_today
    errors.add(:birthday, "は今日より過去のものを選択してください") if birthday > Date.today
  end
end
