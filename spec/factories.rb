FactoryBot.define do
    factory :user, aliases: [:author] do
      sequence(:name) { |n| "User #{n}" }
      email { Faker::Internet.email }
      password { 'BY/21C/0633' }
      confirmed_at { Time.now }
    end
  
    factory :category do
      sequence(:name) { |n| "Category #{n}" }
      icon { 'https://example.com/favicon.png' }
      user
    end
  
    factory :record do
      sequence(:name) { |n| "Record #{n}" }
      amount { Faker::Number.decimal(l_digits: 2) }
      association :author, factory: :user
  
      trait :with_category do
        after(:create) do |record|
          record.categories << create(:category) # Assuming :category is your category factory
        end
      end
    end
    factory :record_with_category, traits: [:with_category]
  end