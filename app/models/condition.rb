class Condition < ApplicationRecord
  belongs_to :wrap
  validates :weight, numericality: { greater_than: 0, message: "は'0'以上でご入力ください"}
  validates :temperature, numericality: { greater_than: 0, message: "は'0'以上でご入力ください" }
end
