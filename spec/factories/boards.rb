FactoryBot.define do
  factory :board do
    user_id { 1 }
    title { "MyString" }
    content { "MyText" }
  end
end
