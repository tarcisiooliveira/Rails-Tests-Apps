# frozen_string_literal: true

FactoryBot.define do
  factory :customer, aliases: %i[user father] do
    transient do 
      upcased do 
        false
      end 
    end

    # Para atributos dinamicos, é necessário colocar a abertura de =>{ }<=
    # caso contrario, não será possível fazer, por exemplo, concatenação
    # email nome+"@mail.com" <= Erro
    # email { nome+"@mail.com" } <= Correto
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

    trait :email do
      sequence(:email) { |n| "email+#{n}@email.com" }
    end

    trait :new_email do
      sequence(:email, 22) { |n| "email+#{n}@email.com" }
    end

    factory :customer_email, traits: [:email]
    factory :customer_new_email, traits: [:new_email]
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
