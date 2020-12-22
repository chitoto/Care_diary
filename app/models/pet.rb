class Pet < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :birthday, presence: true
  validates :species, length: { maximum: 255 }
  validates :memo, length: { maximum: 255 }
  validate :date_before_today

  def date_before_today
    if birthday.present? && birthday > Date.today
      errors.add(:date, ": 未来の日付は使用できません")
    end
  end

  enum gender: { 男の子:1, 女の子:2, わからない:3 }
  mount_uploader :icon, ImageUploader

  belongs_to :group
  has_many :wraps, dependent: :destroy
  has_many :comments, dependent: :destroy

end
