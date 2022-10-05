FactoryBot.define do
  factory :product do
    description { "MyString" }
    price { "9.99" }
    category { create(:category, descritption: 'Produto 01') }
  end
end
