# frozen_string_literal: true

FactoryBot.define do
  factory :customer, aliases: %i[user father] do
    transient do 
      upcased false
    end

    name { Faker::Name.name }
    email { Faker::Internet.email }
    gender { %w[M F].sample }

    trait :customer_vip do
      vip { true }
      days_to_pay { 30 }
    end

    trait :customer_default do
      vip { false }
      days_to_pay { 10 }
    end

    trait :customer_male do
      gender { 'M' }
    end

    trait :customer_female do
      gender { 'F' }
    end

    factory :customer_male, traits: [:customer_male]
    factory :customer_female, traits: [:customer_female]
    factory :customer_male_vip, traits: [:customer_male, :customer_vip]
    factory :customer_female_vip, traits: [:customer_female, :customer_vip]
    factory :customer_default_male, traits: [:customer_male, :customer_default]
    factory :customer_default_female, traits: [:customer_female, :customer_default]

    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcased
    end
  end
end
