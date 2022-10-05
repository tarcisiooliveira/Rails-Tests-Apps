# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer) { build(:customer) }
  # O build ele só cria o constroi o objeto, não persiste ele no banco, precisando de um .save
  # para isso.
  it {
    expect(customer.full_name).to start_with('Sr. ') }
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
  it { expect(customer.vip).to eq(nil) }
end

# RSpec.describe 'Factories com traits', Customer, type: :model do
#   let(:customer) {create(:customer_vip, name: 'Tarcisio Oliveira',
#                                         email: 'tarcisio@email.com')}
#   it { expect(customer.full_name).to eq('Sr. Tarcisio Oliveira') }
#   it { expect(customer.email).to eq('tarcisio@email.com') }
#   it { expect(customer.vip).to eq(true) }
# end

# RSpec.describe 'Usando o attributes_for', Customer, type: :model do
#   # o attributes_for constroi um hash do tipo da classe passada
#   let(:customer) do
#     attributes_for(:customer_default, name: 'Tarcisio Oliveira',
#                                       email: 'tarcisio@email.com')
#   end
#   let(:new_customer) { Customer.new(customer) }

#   let(:transient_customer_true) { create(:customer_vip, name: 'Tarcisio Oliveira', upcased: true) }
#   let(:transient_customer_false) { create(:customer_vip, name: 'Tarcisio Oliveira', upcased: false) }

#   it 'attributes_for' do
#     puts customer
#     # {:name=>"Tarcisio Oliveira", :email=>"tarcisio@email.com", :vip=>true, :days_to_pay=>30}

#     expect(customer[:name]).to eq('Tarcisio Oliveira')
#   end
#   it { expect(customer[:email]).to eq('tarcisio@email.com') }
#   it { expect(customer[:vip]).to eq(false) }
#   it { expect(new_customer.full_name).to eq('Sr. Tarcisio Oliveira') }
#   it { expect(new_customer.email).to eq('tarcisio@email.com') }
#   it { expect(transient_customer_true.name).to eq('TARCISIO OLIVEIRA') }
#   it { expect(transient_customer_false.name).to eq('Tarcisio Oliveira') }
# end

# RSpec.describe 'Customer Male', Customer, type: :model do
#   let(:customer) { create(:customer_male) }
#   it { expect(customer.gender).to eq('M') }
# end

# RSpec.describe 'Customer Female', Customer, type: :model do
#   let(:customer) { create(:customer_female) }
#   it { expect(customer.gender).to eq('F') }
# end

# RSpec.describe 'Customer Male', Customer, type: :model do
#   let(:customer) { create(:customer_vip, :customer_male) }
#   it { expect(customer[:vip]).to eq(true) }
#   it { expect(customer.gender).to eq('M') }
# end

# RSpec.describe 'Customer Female', Customer, type: :model do
#   let(:customer) { create(:customer_default, :customer_female) }
#   it { expect(customer.gender).to eq('F') }
#   it { expect(customer[:vip]).to eq(false) }
# end

RSpec.describe 'Customer Female', Customer, type: :model do
  let(:customer_1) { create(:customer_email) }
  let(:customer_2) { create(:customer_email) }
  it { expect(customer_1.email).to eq('email+2@email.com') }
  it { expect(customer_2.email).to eq('email+3@email.com') }
end

RSpec.describe 'Customer Female', Customer, type: :model do
  let(:customer_1) { create(:customer_new_email) }
  let(:customer_2) { create(:customer_new_email) }

  it { expect(customer_1.email).to eq('email+23@email.com') }
  it { expect(customer_2.email).to eq('email+24@email.com') }
end
