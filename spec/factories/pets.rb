FactoryBot.define do
  factory :pet do
    name { 'factory_pet' }
    birthday { '2020/01/01' }
    gender { '男の子' }
    species { 'rspec' }
    memo { 'rspec' }
    group_id { 'group_id' }
  end
end
