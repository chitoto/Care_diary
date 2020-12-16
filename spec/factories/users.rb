FactoryBot.define do
  factory :user do
    name { 'test_user' }
    email { 'user@factory.com' }
    password { 'password' }
  end
end
