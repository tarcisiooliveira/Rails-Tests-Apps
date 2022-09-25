FactoryBot.define do
  factory :order do
    sequence(:description) { |n| "Pedido número - #{n}" }
    # assossiation :customer, factory: :customer_vip
    # é o mesmo que a linha de baixo. Caso queira passar uma
    # assosiação diferente, então defina na factorie relacionada
    # no caso, customer_vip

    customer
  end


end
