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
