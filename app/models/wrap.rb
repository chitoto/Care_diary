class Wrap < ApplicationRecord
  validates :start_time, presence: true, uniqueness: true
  validates :precaution_title, length: { maximum: 255 }
  validates :precaution_content, length: { maximum: 255 }
  validate :date_before_today

  belongs_to :pet

  has_many :conditions,  dependent: :destroy, index_errors: true
  validates_associated :conditions
  accepts_nested_attributes_for :conditions, allow_destroy: true, reject_if: :all_blank

  has_many :meals,  dependent: :destroy
  accepts_nested_attributes_for :meals, allow_destroy: true, reject_if: :all_blank
  has_many :excretions,  dependent: :destroy
  accepts_nested_attributes_for :excretions, allow_destroy: true, reject_if: :all_blank
  has_many :medicines,  dependent: :destroy
  accepts_nested_attributes_for :medicines, allow_destroy: true, reject_if: :all_blank
  has_many :walks,  dependent: :destroy
  accepts_nested_attributes_for :walks, allow_destroy: true, reject_if: :all_blank

  def date_before_today
    errors.add(:start_time, "は今日より過去のものを選択してください") if start_time > Date.today
  end
end
