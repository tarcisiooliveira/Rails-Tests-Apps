require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'does something' do
    order = create(:order)
    puts order.description
    # puts order.desctiptions
    expect(order.customer).to be_kind_of(Customer)
  end

  describe do
    let(:orders) { create_list(:order, 3) }

    it 'Possui 3 pedidos - create_list' do
      expect(orders.count).to eq(3)
    end
  end

  describe do
    let(:customer) { create(:customer, :with_orders) }
    it 'has_many' do
      expect(customer.order.count).to eq(3)
    end
  end

  describe do
    let(:customer) { create(:customer, :with_orders, qtt_order: 4) }
    it 'has_many' do
      expect(customer.order.count).to eq(4)
    end
  end 

  describe 'Metodo para criar um par do mesmo tipo' do
      let(:customer) { create_pair(:customer) }
      it 'create_pair' do
        expect(customer.count).to eq(2)
      end
    end 

  describe '' do
    let(:customer) do 
      attributes_for_list(:customer_default)
    end 
    # let(:new_customer) { Customer.new(customer) }

    # let(:transient_customer_true) { create(:customer_vip, name: 'Tarcisio Oliveira', upcased: true) }
    # let(:transient_customer_false) { create(:customer_vip, name: 'Tarcisio Oliveira', upcased: false) }

    it 'attributes_for' do 
      puts customer
      # {:name=>"Tarcisio Oliveira", :email=>"tarcisio@email.com", :vip=>true, :days_to_pay=>30}

      expect(customer[:name]).to eq('Tarcisio Oliveira')  
    end
  end 
end
