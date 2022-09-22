# frozen_string_literal: true

FactoryBot.define do
  factory :customer, aliases: %i[user father] do
    name { Faker::Name.name }
    email { Faker::Internet.email }

    factory :customer_vip do
      vip { true }
      days_to_pay { 30 }
    end
  end
end
