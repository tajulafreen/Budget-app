FactoryBot.define do
  factory :user do
    name { 'Example User' }
    email { 'user@example.com' }
    password { 'password' }
  end

  factory :category do
    name { 'Example Category' }
    icon { 'category-icon' }
    association :user, factory: :user
  end

  factory :record do
    name { 'Example Record' }
    amount { 100 }
    association :user, factory: :user
  end
end
