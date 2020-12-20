class Condition < ApplicationRecord
  belongs_to :wrap
  validates :weight, length: { minimum: 0, message: "は'0'以上でご入力ください"}
  validates :temperature, length: { minimum: 0, message: "は'0'以上でご入力ください" }
end
