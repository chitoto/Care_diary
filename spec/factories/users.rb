FactoryBot.define do
  factory :user do
    name { 'factory_user' }
    email { 'user@factory.com' }
    password { 'password' }
  end
end
