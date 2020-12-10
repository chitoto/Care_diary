class Pet < ApplicationRecord
  validates :name, presence: true

  enum gender: { 男の子:1, 女の子:2, わからない:3 }
end
