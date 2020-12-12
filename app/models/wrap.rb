class Wrap < ApplicationRecord
  validates :date_record, presence: true
  belongs_to :pet
end
