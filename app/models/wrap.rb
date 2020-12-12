class Wrap < ApplicationRecord
  validates :date_record, presence: true
  belongs_to :pet
  has_many :conditions,  dependent: :destroy
  accepts_nested_attributes_for :conditions, allow_destroy: true, reject_if: :all_blank
end
