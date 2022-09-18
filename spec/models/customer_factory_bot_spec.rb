# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer) { build(:customer) }
  # O build ele só cria o constroi o objeto, não persiste ele no banco, precisando de um .save
  # para isso.

  it { expect(customer.full_name).to start_with('Sr. ') }
  it { expect(customer.email.include?('@')).to be_truthy }
  it { expect(customer.email).to be_include('@') }
  it { expect { build(:customer) }.to change { Customer.all.size }.by(0) }
end

RSpec.describe Customer, type: :model do
  let(:customer) { create(:customer) }
  # O create realiza a construção e também salva o objeto, alterando então a quantidade no banco.

  it { expect(customer.full_name).to start_with('Sr. ') }
  it { expect(customer.email.include?('@')).to be_truthy }
  it { expect(customer.email).to be_include('@') }
  it { expect { create(:customer) }.to change { Customer.all.size }.by(1) }
end

RSpec.describe 'Definindo Dados da Factorie', Customer, type: :model do
  let(:customer) do
    create(:customer, name: 'Tarcisio Oliveira',
                      email: 'tarcisio@email.com')
  end
  # Define o nome para a Factories, podendo então validar o nome completo e não depender
  # da gem Faker para isso

  it { expect(customer.full_name).to eq('Sr. Tarcisio Oliveira') }
  it { expect(customer.email).to eq('tarcisio@email.com') }
end

RSpec.describe 'Usando Aliases', Customer, type: :model do
  let(:customer) do
    create(:user, name: 'Tarcisio Oliveira', email: 'tarcisio@email.com')
  end

  it { expect(customer.full_name).to eq('Sr. Tarcisio Oliveira') }
  it { expect(customer.email).to eq('tarcisio@email.com') }
end
